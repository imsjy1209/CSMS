package com.team3.CSMS.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team3.CSMS.model.Activity;

public interface ActivityRepository extends JpaRepository<Activity, Integer> {

	@Modifying
	@Query(value = "delete from student_activity where fk_act_id=:act_id and fk_stu_id=:stu_id"
	, nativeQuery = true)
	public void quit(@Param(value = ("act_id")) int act_id, @Param(value = "stu_id") int stu_id);

	@Query(value = "from Activity where removed=0 order by date")
	public List<Activity> getAll();

	@Modifying
	@Query(value = "update Activity set removed = 0 where id=:id")
	public void already(@Param("id") int id);

	@Modifying
	@Query(value = "update Activity set removed = 1 where id=:id")
	public void remove(@Param("id") int id);

//	@Query(value="from Activity where removed=0 order by date")
//	public List<Activity> getAllByDate();
	@Query(value = "select *from Activity where removed=0 "
			+ "and name like CONCAT('%',:name,'%')order by date", nativeQuery = true)
	public List<Activity> search(@Param(value = ("name")) String name);

}
