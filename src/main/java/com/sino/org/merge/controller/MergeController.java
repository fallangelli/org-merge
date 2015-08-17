package com.sino.org.merge.controller;

import com.sino.org.merge.entity.TreeNode;
import com.sino.org.merge.service.OrgEDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/merge")
public class MergeController {
    @Autowired
    private OrgEDService edService;

    @RequestMapping(value = "/show")
    public String show(ModelMap map) {

        return "merge_result1";
    }

    @RequestMapping(value = "/tree")
    @ResponseBody
    public List<TreeNode> tree() {
        return edService.getTreeData();
    }
}

