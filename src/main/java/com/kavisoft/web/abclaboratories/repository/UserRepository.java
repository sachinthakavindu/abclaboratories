package com.kavisoft.web.abclaboratories.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kavisoft.web.abclaboratories.model.User;

public interface UserRepository extends JpaRepository<User, Integer>{

}
