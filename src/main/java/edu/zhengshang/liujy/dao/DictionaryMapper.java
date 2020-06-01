package edu.zhengshang.liujy.dao;

import edu.zhengshang.liujy.bean.Dictionary;

import java.util.List;



public interface DictionaryMapper {

    int deleteByPrimaryKey(Integer id);


    int insert(Dictionary record);


    int insertSelective(Dictionary record);


    Dictionary selectByPrimaryKey(Integer id);

    List<Dictionary> selectByPrimary(String unit);

    int updateByPrimaryKeySelective(Dictionary record);

    int updateByPrimaryKey(Dictionary record);

}