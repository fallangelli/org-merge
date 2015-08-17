package com.sino.org.merge.service;

import com.sino.org.merge.entity.OrgED;
import com.sino.org.merge.entity.OrgQY;
import com.sino.org.merge.repository.OrgQYDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lcheng on 2014/4/13.
 */
@Service
public class OrgQYService {

    @Autowired
    private OrgQYDao qyDao;

    private static Logger log = LoggerFactory.getLogger(OrgQYService.class);

    public List<OrgQY> getAllQY() {
        return qyDao.findAll();
    }

    public List<OrgQY> findRootQY() {
        List<OrgQY> list = qyDao.findByUpOrgCodeIsNull();
        return list;
    }

    public List<OrgQY> findByOrgLevel(int level) {
        return qyDao.findByOrgLevel(level);
    }

    public List<OrgQY> findByOrgCode(String orgCode) {
        return qyDao.findByOrgCode(orgCode);
    }

    public List<OrgQY> findByUpOrgCode(String upOrgCode) {
        if (upOrgCode != null)
            return qyDao.findByUpOrgCode(upOrgCode);
        return null;
    }

    public List<OrgQY> findByUpOrg(OrgED upOrg) {
        if (upOrg != null)
            return qyDao.findByUpOrgCode(upOrg.getOrgQYCode());
        return null;
    }
}
