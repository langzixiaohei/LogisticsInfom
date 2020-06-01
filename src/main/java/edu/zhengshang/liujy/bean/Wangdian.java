package edu.zhengshang.liujy.bean;

public class Wangdian {
    private Integer id;

    private String wdName;

    private String phone;

    private String diZhi;

    private String fanWei;

    private Integer isDel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getWdName() {
        return wdName;
    }

    public void setWdName(String wdName) {
        this.wdName = wdName == null ? null : wdName.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getDiZhi() {
        return diZhi;
    }

    public void setDiZhi(String diZhi) {
        this.diZhi = diZhi == null ? null : diZhi.trim();
    }

    public String getFanWei() {
        return fanWei;
    }

    public void setFanWei(String fanWei) {
        this.fanWei = fanWei == null ? null : fanWei.trim();
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }
}