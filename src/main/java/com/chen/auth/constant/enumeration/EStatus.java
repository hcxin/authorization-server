package com.chen.auth.constant.enumeration;

/**
 * @author haichen
 */
public enum EStatus {
    DISABLE("禁用", 0),
    NORMAL("正常", 1);

    private String name;
    private int index;

    EStatus(String name, int index) {
        this.name = name;
        this.index = index;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }
}