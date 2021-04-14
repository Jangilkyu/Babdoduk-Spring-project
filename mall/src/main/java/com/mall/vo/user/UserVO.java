package com.mall.vo.user;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class UserVO {
	
	private String mem_id;
    private String mem_pwd;
    private String mem_name;
    private String mem_birth;
    private String mem_email;
    private String mem_phone;
    private String mem_zipCode;
    private String mem_address;
    private String mem_detailAddress;
	
}
