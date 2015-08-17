package com.sino.org.merge.entity;

import com.sino.org.merge.utils.Constants;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created by lcheng on 2014/4/13.
 */
@Entity
@Table(name = "temp_jh_ed")
public class OrgED implements Serializable {
    @Id
    private String orgCode;
    private String orgName;
    private String upOrgCode;
    private int orgLevel;
    private String orgGRCode;
    private String orgGRName;
    private String upOrgGRCode;
    private int orgGRLevel;
    private String orgQYCode;
    private String orgQYName;
    private String upOrgQYCode;
    private int orgQYLevel;

    public Constants.STATE getOrgState() {
        return orgState;
    }

    public void setOrgState(Constants.STATE orgState) {
        this.orgState = orgState;
    }

    private Constants.STATE orgState;

    public OrgED() {
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

    public String getOrgGRCode() {
        return orgGRCode;
    }

    public void setOrgGRCode(String orgGRCode) {
        this.orgGRCode = orgGRCode;
    }

    public String getOrgGRName() {
        return orgGRName;
    }

    public void setOrgGRName(String orgGRName) {
        this.orgGRName = orgGRName;
    }

    public String getUpOrgGRCode() {
        return upOrgGRCode;
    }

    public void setUpOrgGRCode(String upOrgGRCode) {
        this.upOrgGRCode = upOrgGRCode;
    }

    public int getOrgGRLevel() {
        return orgGRLevel;
    }

    public void setOrgGRLevel(int orgGRLevel) {
        this.orgGRLevel = orgGRLevel;
    }

    public String getOrgQYCode() {
        return orgQYCode;
    }

    public void setOrgQYCode(String orgQYCode) {
        this.orgQYCode = orgQYCode;
    }

    public String getOrgQYName() {
        return orgQYName;
    }

    public void setOrgQYName(String orgQYName) {
        this.orgQYName = orgQYName;
    }

    public String getUpOrgQYCode() {
        return upOrgQYCode;
    }

    public void setUpOrgQYCode(String upOrgQYCode) {
        this.upOrgQYCode = upOrgQYCode;
    }

    public int getOrgQYLevel() {
        return orgQYLevel;
    }

    public void setOrgQYLevel(int orgQYLevel) {
        this.orgQYLevel = orgQYLevel;
    }
}
