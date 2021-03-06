package com.fortum.nokid.entities;

import org.springframework.data.repository.CrudRepository;

/**
 * Created by yuriy on 10/08/16.
 */
public interface LectureDAO extends CrudRepository<Lecture, Long> {

    Lecture findBynameIgnoreCase(String name);

}
