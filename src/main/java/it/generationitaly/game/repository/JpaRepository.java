package it.generationitaly.game.repository;

import java.util.List;

public interface JpaRepository<T, PK> {

	void save(T entity);

	void update(T entity);

	void delete(T entity);

	void deleteById(PK primaryKey);

	T findById(PK primaryKey);

	List<T> findAll();

	Long count();

}
