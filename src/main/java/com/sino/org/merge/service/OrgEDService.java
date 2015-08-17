package com.sino.org.merge.service;

import com.sino.org.merge.entity.OrgED;
import com.sino.org.merge.entity.TreeNode;
import com.sino.org.merge.repository.OrgEDDao;
import com.sino.org.merge.utils.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lcheng on 2014/4/13.
 */
@Service
public class OrgEDService {

    @Autowired
    private OrgEDDao edDao;
    private static Logger log = LoggerFactory.getLogger(OrgEDService.class);


    public List<OrgED> getAll() {
        return edDao.findAll();
    }

    public List<OrgED> findRootED() {
        List<OrgED> list = edDao.findByUpOrgCodeIsNull();
        return list;
    }

    public List<OrgED> findByOrgLevel(int level) {
        return edDao.findByOrgLevel(level);
    }


    public List<OrgED> findByOrgCode(String orgCode) {
        return edDao.findByOrgCode(orgCode);
    }

    public List<OrgED> findByUpOrgCode(String upOrgCode) {
        return edDao.findByUpOrgCode(upOrgCode);
    }

    public void saveOrgED(OrgED orgED) {
        edDao.save(orgED);
    }

    public void deleteAllInBatch() {
        edDao.deleteAllInBatch();
    }

    public void markMulti() {
        List<OrgED> listQY = edDao.findQYMulti();
        for (OrgED ed : listQY) {
            ed.setOrgState(Constants.STATE.ERR_QY_MULT);
            saveOrgED(ed);
        }
        List<OrgED> listGR = edDao.findGRMulti();
        for (OrgED ed : listGR) {
            ed.setOrgState(Constants.STATE.ERR_GR_MULT);
            saveOrgED(ed);
        }

    }

    public List<TreeNode> getTreeData() {
        List<TreeNode> retList = new ArrayList<>();
        List<OrgED> roots = findRootED();
        for (OrgED root : roots) {
            TreeNode rootNode = new TreeNode();
            rootNode.setId(root.getOrgCode());
            String text = "<font color='" + root.getOrgState().getColor() + "'>" + root.getOrgState().getName() + "</font>";
            rootNode.setName(root.getOrgName() + "--------------" + text);
            rootNode.setParentId(root.getUpOrgCode());

            if (rootNode.getChildren() == null)
                rootNode.setChildren(new ArrayList<TreeNode>());
            fillTreeData(rootNode);

            retList.add(rootNode);
        }
        return retList;
    }

    private void fillTreeData(TreeNode root) {


        List<OrgED> orgList = findByUpOrgCode(root.getId());
        for (OrgED org : orgList) {
            TreeNode node = new TreeNode();
            node.setId(org.getOrgCode());
            String text = "<font color='" + org.getOrgState().getColor() + "'>" + org.getOrgState().getName() + "</font>";
            node.setName(org.getOrgName() + "--------------" + text);
            node.setParentId(org.getUpOrgCode());
            if (org.getOrgState().getIndex() > 2)
                node.setHasError(true);
            if (root.getChildren() == null)
                root.setChildren(new ArrayList<TreeNode>());
            root.getChildren().add(node);

            fillTreeData(node);
        }
    }
}
