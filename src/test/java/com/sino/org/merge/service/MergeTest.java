package com.sino.org.merge.service;

import com.sino.org.merge.business.MergeManager;
import com.sino.org.merge.entity.OrgQY;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author lcheng
 * @version 1.0
 *          ${tags}
 */
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class MergeTest {
    @Autowired
    private MergeManager manager;

    @Autowired
    private OrgQYService qyService;


    @Test
    public void testMerge() {
        manager.mergeTree();

    }

    @Test
    public void testQYService() {
        List<OrgQY> listQY = qyService.getAllQY();
        Assert.assertTrue(listQY.size() > 0);

        List<OrgQY> listRootQY = qyService.findByOrgLevel(1);

        List<OrgQY> listNamedQY = qyService.findByOrgCode("29003010005");
    }

}
