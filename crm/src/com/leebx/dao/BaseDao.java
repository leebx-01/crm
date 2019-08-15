package com.leebx.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;


public interface BaseDao<T> {
	public void save(T t);
	public void update(T t);
	public void delete(T t);
	//��ѯ����
	public List<T> findAll();
	//����id��
	public T findById(Serializable id);
	//��ҳ��ѯ
	public List<T> findByPage(DetachedCriteria detachedCriteria,Integer first, Integer pageSize);
	//��ѯ�ܼ�¼��
	public Integer findCount(DetachedCriteria detachedCriteria);
}
