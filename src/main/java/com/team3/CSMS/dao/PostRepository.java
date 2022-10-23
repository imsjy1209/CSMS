package com.team3.CSMS.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.team3.CSMS.model.Post;

public interface PostRepository extends JpaRepository<Post, Integer> {
	@Modifying
	@Query(value = "update Post set isDelete = 0 where id=:id")
	public void already(int id);

	@Modifying
	@Query(value = "update Post set isDelete = 1 where id=:id")
	public void remove(int id);

	@Query(value = "from Post where isDelete = 0")
	public List<Post> viewAllBySchool();

	@Query(value = "from Post where isDelete = 0 and userType = 2")
	public List<Post> viewAllByAll();

}
