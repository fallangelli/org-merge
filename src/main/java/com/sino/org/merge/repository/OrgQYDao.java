package com.sino.org.merge.repository;

import com.sino.org.merge.entity.OrgGR;
import com.sino.org.merge.entity.OrgQY;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @author lcheng
 * @version 1.0
 *          ${tags}
 */
public interface OrgQYDao extends JpaRepository<OrgQY, Long> {

    public List<OrgQY> findAll();

    public List<OrgQY> findByOrgLevel(int level);

    public List<OrgQY> findByOrgCode(String orgCode);

    public List<OrgQY> findByUpOrgCode(String upOrgCode);

    public List<OrgQY> findByUpOrgCodeIsNull();
}
