package edu.zhengshang.liujy.dao;

import edu.zhengshang.liujy.bean.Admin;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    /**
     * 登录
     * @param admin
     * @return
     */
    Admin login(Admin admin);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}