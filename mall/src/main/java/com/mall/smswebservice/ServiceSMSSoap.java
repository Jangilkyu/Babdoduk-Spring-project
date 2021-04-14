/**
 * ServiceSMSSoap.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.mall.smswebservice;

public interface ServiceSMSSoap extends java.rmi.Remote {

    /**
     * SMS를 호출 즉시 발송합니다. SendSMS (아이디,해쉬,보내는이 번호,받는이 번호,전문내용)
     */
    public java.lang.String sendSMS(java.lang.String smsID, java.lang.String hashValue, java.lang.String senderPhone, java.lang.String receivePhone, java.lang.String smsContent) throws java.rmi.RemoteException;

    /**
     * SMS를 호출 즉시 발송합니다. SendSMSwnc (아이디,해쉬,구분자,보내는이 번호,받는이 번호,전문내용)
     */
    public java.lang.String sendSMSwnc(java.lang.String smsID, java.lang.String hashValue, java.lang.String gubun, java.lang.String senderPhone, java.lang.String receivePhone, java.lang.String smsContent) throws java.rmi.RemoteException;

    /**
     * SMS를 예약시간에 발송합니다. SendSMSReserve (아이디,해쉬,보내는이 번호,받는이 번호,전문내용,예약날짜,예약시간,사용자
    * 정의값)
     */
    public java.lang.String sendSMSReserve(java.lang.String smsID, java.lang.String hashValue, java.lang.String senderPhone, java.lang.String receivePhone, java.lang.String smsContent, java.lang.String reserveDate, java.lang.String reserveTime, java.lang.String userDefine) throws java.rmi.RemoteException;

    /**
     * URL CALLBACK를 호출 즉시 발송합니다. SendSMSCallBack(아이디,해쉬,보내는이 번호,받는이
     * 번호,URL주소,전문내용)
     */
    public java.lang.String sendSMSCallBack(java.lang.String smsID, java.lang.String hashValue, java.lang.String senderPhone, java.lang.String receivePhone, java.lang.String callbackUrl, java.lang.String smsContent) throws java.rmi.RemoteException;

    /**
     * URL CALLBACK를 예약시간에 발송합니다. SendSMSCallBackReserve(아이디,해쉬,보내는이
     * 번호,받는이 번호,URL주소,전문내용,예약날짜,예약시간,사용자 정의값)
     */
    public java.lang.String sendSMSCallBackReserve(java.lang.String smsID, java.lang.String hashValue, java.lang.String senderPhone, java.lang.String receivePhone, java.lang.String callbackUrl, java.lang.String smsContent, java.lang.String reserveDate, java.lang.String reserveTime, java.lang.String userDefine) throws java.rmi.RemoteException;

    /**
     * 예약 발송을 취소합니다.(아이디,해쉬,삭제값,모드)
     */
    public int reserveCancle(java.lang.String smsID, java.lang.String hashValue, java.lang.String searchValue, java.lang.String mode) throws java.rmi.RemoteException;

    /**
     * 남은 양을 조회합니다.(아이디,해쉬)
     */
    public int getRemainCount(java.lang.String smsID, java.lang.String hashValue) throws java.rmi.RemoteException;
}
