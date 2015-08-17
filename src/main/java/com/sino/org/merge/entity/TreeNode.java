package com.sino.org.merge.entity;

import com.sino.org.merge.utils.Constants;

import java.util.List;

/**
 * Created by Administrator on 2015/8/12.
 */
public class TreeNode {
    private String id;
    private String name;
    private Constants.STATE state;
    private String problem;
    private String parentId;
    private boolean hasError = false;

    private List<TreeNode> children;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProblem() {
        return problem;
    }

    public void setProblem(String problem) {
        this.problem = problem;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public List<TreeNode> getChildren() {
        return children;
    }

    public void setChildren(List<TreeNode> children) {
        this.children = children;
    }

    public Constants.STATE getState() {
        return state;
    }

    public void setState(Constants.STATE state) {
        this.state = state;
    }

    public boolean isHasError() {
        return hasError;
    }

    public void setHasError(boolean hasError) {
        this.hasError = hasError;
    }
}
