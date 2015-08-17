package com.sino.org.merge.business;

import com.sino.org.merge.entity.OrgED;
import com.sino.org.merge.entity.OrgGR;
import com.sino.org.merge.entity.OrgQY;
import com.sino.org.merge.service.OrgEDService;
import com.sino.org.merge.service.OrgGRService;
import com.sino.org.merge.service.OrgQYService;
import com.sino.org.merge.utils.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * Created by Administrator on 2015/8/6.
 */
@Component
public class MergeManager {
    @Autowired
    private OrgQYService qyService;
    @Autowired
    private OrgGRService grService;
    @Autowired
    private OrgEDService edService;

    private List<String> listMergeWord;

    private static Logger log = LoggerFactory.getLogger(MergeManager.class);

    public MergeManager() {
        Properties props = new Properties();

        try {
            props = PropertiesLoaderUtils.loadAllProperties("appConfig.properties");
            String mergeWord = props.getProperty("MergeWord");
            listMergeWord = java.util.Arrays.asList(mergeWord.split(","));


            log.info("合并词 : " + mergeWord);
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }


    }

    public void mergeTree() {
        edService.deleteAllInBatch();

        List<OrgED> rootED = mergeRoot();

        if (rootED == null) {
            log.error("无法合并根节点");
            return;
        }

        for (OrgED ed : rootED) {
            List<OrgED> result = mergeByParent(ed);
            mergeEDList(result);
        }
        markMulti();

    }


    private List<OrgED> mergeRoot() {
        List<OrgED> retList = new ArrayList<>();
        List<OrgQY> rootQY = qyService.findRootQY();
        List<OrgGR> rootGR = grService.findRootGR();

        for (OrgQY qy : rootQY) {
            boolean qyMerged = false;
            for (OrgGR gr : rootGR) {
                OrgED ed = mergeNode(qy, gr, null);
                if (ed != null) {
                    qyMerged = true;
                    retList.add(ed);
                    rootGR.remove(gr);
                    break;
                }
            }
            if (!qyMerged) {
                log.info("个人树中无机构： " + qy.getOrgName());
                OrgED orgED = new OrgED();
                orgED.setOrgCode("_" + qy.getOrgCode());
                orgED.setOrgName("_" + qy.getOrgName());

                orgED.setUpOrgCode(null);
                orgED.setOrgLevel(1);


                orgED.setOrgQYCode(qy.getOrgCode());
                orgED.setOrgQYName(qy.getOrgName());
                orgED.setUpOrgQYCode(qy.getUpOrgCode());
                orgED.setOrgQYLevel(qy.getOrgLevel());
                orgED.setOrgState(Constants.STATE.ONLY_QY);
                edService.saveOrgED(orgED);
                retList.add(orgED);
            }
        }

        for (OrgGR gr : rootGR) {
            boolean grMerged = false;
            for (OrgQY qy : rootQY) {
                OrgED ed = mergeNode(qy, gr, null);
                if (ed != null) {
                    grMerged = true;
                    retList.add(ed);
                    rootGR.remove(gr);
                    break;
                }
            }

            if (!grMerged) {
                log.info("企业树中无机构： " + gr.getOrgName());
                OrgED orgED = new OrgED();
                orgED.setOrgCode(gr.getOrgCode() + "_");
                orgED.setOrgName(gr.getOrgName() + "_");

                orgED.setUpOrgCode(null);
                orgED.setOrgLevel(1);


                orgED.setOrgGRCode(gr.getOrgCode());
                orgED.setOrgGRName(gr.getOrgName());
                orgED.setUpOrgGRCode(gr.getUpOrgCode());
                orgED.setOrgGRLevel(gr.getOrgLevel());
                orgED.setOrgState(Constants.STATE.ONLY_GR);
                edService.saveOrgED(orgED);
                retList.add(orgED);
            }
        }
        return retList;
    }

    public void mergeEDList(List<OrgED> edList) {


        for (OrgED orgED : edList) {
            List<OrgED> result = mergeByParent(orgED);
            if (result.size() > 0) {
                mergeEDList(result);
            }
        }

    }

    private boolean checkMergeWord(String orgNameQY, String orgNameGR) {
        String currOrgQYName = orgNameQY;
        String currOrgGRName = orgNameGR;
        for (String word : listMergeWord) {
            currOrgQYName = currOrgQYName.replace(word, "");
            currOrgGRName = currOrgGRName.replace(word, "");
        }


        if (currOrgQYName.equals(currOrgGRName))
            return true;
        else
            return false;
    }

    private OrgED mergeNode(OrgQY orgQY, OrgGR orgGR, OrgED parent) {

        if (orgGR.getOrgName() == orgQY.getOrgName()) {
            OrgED orgED = doMerge(orgQY, orgGR, parent);
            orgED.setOrgState(Constants.STATE.NOMAL);
            edService.saveOrgED(orgED);
            log.info("节点名称一致，合并");
            return orgED;

        } else if (checkMergeWord(orgQY.getOrgName(), orgGR.getOrgName())) {
            OrgED orgED = doMerge(orgQY, orgGR, parent);
            orgED.setOrgState(Constants.STATE.NOMAL);
            edService.saveOrgED(orgED);
            log.info("节点名称匹配成功，合并：" + orgGR.getOrgName() + " + " + orgQY.getOrgName());
            return orgED;
        }

        return null;
    }

    private OrgED doMerge(OrgQY orgQY, OrgGR orgGR, OrgED parent) {
        OrgED orgED = new OrgED();

        if (orgGR != null) {
            orgED.setOrgGRCode(orgGR.getOrgCode());
            orgED.setOrgGRName(orgGR.getOrgName());
            orgED.setUpOrgGRCode(orgGR.getUpOrgCode());
            orgED.setOrgGRLevel(orgGR.getOrgLevel());
        }

        if (orgQY != null) {
            orgED.setOrgQYCode(orgQY.getOrgCode());
            orgED.setOrgQYName(orgQY.getOrgName());
            orgED.setUpOrgQYCode(orgQY.getUpOrgCode());
            orgED.setOrgQYLevel(orgQY.getOrgLevel());
        }

        orgED.setOrgCode(orgGR.getOrgCode() + "_" + orgQY.getOrgCode());
        orgED.setOrgName(orgGR.getOrgName() + "_" + orgQY.getOrgName());
        if (parent != null) {
            orgED.setUpOrgCode(parent.getOrgCode());
            orgED.setOrgLevel(parent.getOrgLevel() + 1);
        } else {
            orgED.setUpOrgCode(null);
            orgED.setOrgLevel(1);
        }

        return orgED;
    }


    private List<OrgED> mergeByParent(OrgED parent) {

        List<OrgQY> listQY = new ArrayList<OrgQY>();
        List<OrgGR> listGR = new ArrayList<OrgGR>();

        if (parent.getOrgQYCode() != null)
            listQY = qyService.findByUpOrgCode(parent.getOrgQYCode());
        if (parent.getOrgGRCode() != null)
            listGR = grService.findByUpOrgCode(parent.getOrgGRCode());


        List<OrgED> listResult = new ArrayList<OrgED>();


        if (listGR.size() <= 0 && listQY.size() <= 0)
            return listResult;


        for (OrgQY qy : listQY) {
            boolean qyMerged = false;
            for (OrgGR gr : listGR) {
                OrgED mergedED = mergeNode(qy, gr, parent);
                if (mergedED != null) {
                    qyMerged = true;
                    listResult.add(mergedED);
                    listGR.remove(gr);
                    break;
                }
            }

            if (!qyMerged) {
                log.info("个人树中无机构： " + qy.getOrgName());
                OrgED orgED = new OrgED();
                orgED.setOrgCode("_" + qy.getOrgCode());
                orgED.setOrgName("_" + qy.getOrgName());
                if (parent != null) {
                    orgED.setUpOrgCode(parent.getOrgCode());
                    orgED.setOrgLevel(parent.getOrgLevel() + 1);
                } else {
                    orgED.setUpOrgCode(null);
                    orgED.setOrgLevel(1);
                }

                orgED.setOrgQYCode(qy.getOrgCode());
                orgED.setOrgQYName(qy.getOrgName());
                orgED.setUpOrgQYCode(qy.getUpOrgCode());
                orgED.setOrgQYLevel(qy.getOrgLevel());
                orgED.setOrgState(Constants.STATE.ONLY_QY);
                edService.saveOrgED(orgED);
                listResult.add(orgED);
            }
        }


        for (OrgGR gr : listGR) {
            boolean grMerged = false;
            for (OrgQY qy : listQY) {
                OrgED mergedED = mergeNode(qy, gr, parent);
                if (mergedED != null) {
                    grMerged = true;
                    listResult.add(mergedED);
                    listQY.remove(qy);
                    break;
                }
            }

            if (!grMerged) {
                log.info("企业树中无机构： " + gr.getOrgName());
                OrgED orgED = new OrgED();
                orgED.setOrgCode(gr.getOrgCode() + "_");
                orgED.setOrgName(gr.getOrgName() + "_");
                if (parent != null) {
                    orgED.setUpOrgCode(parent.getOrgCode());
                    orgED.setOrgLevel(parent.getOrgLevel() + 1);
                } else {
                    orgED.setUpOrgCode(null);
                    orgED.setOrgLevel(1);
                }

                orgED.setOrgGRCode(gr.getOrgCode());
                orgED.setOrgGRName(gr.getOrgName());
                orgED.setUpOrgGRCode(gr.getUpOrgCode());
                orgED.setOrgGRLevel(gr.getOrgLevel());
                orgED.setOrgState(Constants.STATE.ONLY_GR);
                edService.saveOrgED(orgED);
                listResult.add(orgED);
            }
        }
        return listResult;
    }

    private void markMulti() {
        edService.markMulti();
    }
}
