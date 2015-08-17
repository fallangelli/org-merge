package com.sino.org.merge.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created by lcheng on 2014/4/13.
 */
@Entity
@Table(name = "temp_jh_qy")
public class OrgQY implements Serializable {
    @Id
    private String orgCode;
    private String orgName;
    private String upOrgCode;
    private int orgLevel;

    public OrgQY() {
    }

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public String getUpOrgCode() {
        return upOrgCode;
    }

    public void setUpOrgCode(String upOrgCode) {
        this.upOrgCode = upOrgCode;
    }

    public int getOrgLevel() {
        return orgLevel;
    }

    public void setOrgLevel(int orgLevel) {
        this.orgLevel = orgLevel;
    }
}
