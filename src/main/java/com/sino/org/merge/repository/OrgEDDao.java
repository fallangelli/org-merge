package com.sino.org.merge.repository;

import com.sino.org.merge.entity.OrgED;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrgEDDao extends JpaRepository<OrgED, Long> {

    @Query(value = "SELECT * FROM temp_jh_ed ORDER BY ORGLEVEL", nativeQuery = true)
    public List<OrgED> findAll();

    public List<OrgED> findByOrgLevel(int level);

    public List<OrgED> findByOrgCode(String orgCode);

    public List<OrgED> findByUpOrgCode(String upOrgCode);

    public List<OrgED> findByUpOrgCodeIsNull();


    @Query(value = "SELECT * FROM temp_jh_ed a WHERE" +
            " ((SELECT COUNT(*) FROM temp_jh_ed b WHERE b.orgqyname = a.orgqyname) > 1)", nativeQuery = true)
    public List<OrgED> findQYMulti();

    @Query(value = "SELECT * FROM temp_jh_ed a WHERE" +
            " ((SELECT COUNT(*) FROM temp_jh_ed b WHERE b.orggrname = a.orggrname) > 1)", nativeQuery = true)
    public List<OrgED> findGRMulti();

    public void deleteAllInBatch();

    public OrgED save(OrgED orgED);


}
