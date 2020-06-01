package edu.zhengshang.liujy.bean;

public class Dictionary {

    private Integer id;


    private String unit;


    private String content;


    private Integer isdel;


    public Integer getId() {
        return id;
    }


    public void setId(Integer id) {
        this.id = id;
    }


    public String getUnit() {
        return unit;
    }


    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
    }


    public String getContent() {
        return content;
    }


    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }


    public Integer getIsdel() {
        return isdel;
    }


    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }
}