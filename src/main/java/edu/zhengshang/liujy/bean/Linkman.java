package edu.zhengshang.liujy.bean;

import lombok.ToString;

@ToString
public class Linkman {
    private Integer id;

    private Integer userId;

    private String realName;

    private String phone;

    private String shouAddress;

    private Integer isDel;


    //新加属性，查user表和linkman表综合字段
    private String shouname;//对应字段别名
    private String shouphone;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getShouAddress() {
        return shouAddress;
    }

    public void setShouAddress(String shouAddress) {
        this.shouAddress = shouAddress == null ? null : shouAddress.trim();
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }




    public String getShouname() {
        return shouname;
    }

    public void setShouname(String shouname) {
        this.shouname = shouname;
    }

    public String getShouphone() {
        return shouphone;
    }

    public void setShouphone(String shouphone) {
        this.shouphone = shouphone;
    }
}