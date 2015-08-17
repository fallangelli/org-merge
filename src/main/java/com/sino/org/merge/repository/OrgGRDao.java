package com.sino.org.merge.repository;

import com.sino.org.merge.entity.OrgGR;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrgGRDao extends JpaRepository<OrgGR, Long> {

    public List<OrgGR> findAll();

    public List<OrgGR> findByOrgLevel(int level);

    public List<OrgGR> findByOrgCode(String orgCode);

    public List<OrgGR> findByUpOrgCode(String upOrgCode);

    public List<OrgGR> findByUpOrgCodeIsNull();

}
