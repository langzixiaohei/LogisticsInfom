package edu.zhengshang.liujy.dao;

import edu.zhengshang.liujy.bean.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    /**
     * 登录
     * @param user
     * @return
     */
    User selectByPrimary(User user);

    User selectByPrimary1(User user);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}