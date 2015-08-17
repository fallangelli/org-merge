package com.sino.org.merge.service;

import com.sino.org.merge.entity.OrgED;
import com.sino.org.merge.entity.OrgGR;
import com.sino.org.merge.repository.OrgGRDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lcheng on 2014/4/13.
 */
@Service
public class OrgGRService {

    @Autowired
    private OrgGRDao grDao;
    private static Logger log = LoggerFactory.getLogger(OrgQYService.class);


    public List<OrgGR> findRootGR() {
        List<OrgGR> list = grDao.findByUpOrgCodeIsNull();
        return list;
    }


    public List<OrgGR> getAllQY() {
        return grDao.findAll();
    }


    public List<OrgGR> findByOrgLevel(int level) {
        return grDao.findByOrgLevel(level);
    }


    public List<OrgGR> findByOrgCode(String orgCode) {
        return grDao.findByOrgCode(orgCode);
    }

    public List<OrgGR> findByUpOrgCode(String upOrgCode) {
        if (upOrgCode != null)
            return grDao.findByUpOrgCode(upOrgCode);
        return null;
    }


    public List<OrgGR> findByUpOrg(OrgED upOrg) {
        if (upOrg != null)
            return grDao.findByUpOrgCode(upOrg.getOrgGRCode());
        return null;
    }
}
