package edu.zhengshang.liujy.dao;

import edu.zhengshang.liujy.bean.Goods;

import java.util.List;

public interface GoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer id);

    /**
     * 根据名字查询
     * @param name
     * @return
     */
    Goods selectByPrimaryKey1(String name);

    /**
     * 查询商品状态
     * @param goodstype
     * @return
     */
    List<Goods> selectgoodzhuangtai(String goodstype);

    /**
     * 查询所有的
     * @param goods
     * @return
     */
    List<Goods> getbylist(Goods goods);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);
}