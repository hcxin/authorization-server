package com.chen.auth.constant;

/**
 * @author haichen
 */
public final class Constant {
    public static final String CLAIM_USERID = "userId";
    public static final String CLAIM_AUTHORITIES = "authorities";
    public static final String LOGIN_PAGE_URL = "/login";
    public static final String[] PERMIT_ALL_URL_LIST = new String[]{"/assets/**", "/webjars/**", Constant.LOGIN_PAGE_URL};
}
