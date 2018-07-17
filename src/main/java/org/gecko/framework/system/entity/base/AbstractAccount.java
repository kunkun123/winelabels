package org.gecko.framework.system.entity.base;

import org.codehaus.jackson.map.annotate.JsonDeserialize;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;
import org.gecko.common.utils.JsonTimeDeserializer;
import org.gecko.common.utils.JsonTimeSerializer;
import org.gecko.framework.base.BaseEntity;
import org.gecko.framework.system.entity.enums.Gender;

import java.sql.Timestamp;

public abstract class AbstractAccount extends BaseEntity {

    private static final long serialVersionUID = 1L;
    // 基本信息
    @GeckoField(fieldType = FieldType.STRING, length = 10, nullable = true, description = "真实姓名", searchable = true)
    private String realName;

    @GeckoField(fieldType = FieldType.STRING, unique = true, description = "账号", searchable = true)
    private String principal;

    @GeckoField(fieldType = FieldType.STRING, nullable = true, description = "性别", searchable = true)
    private String gender;

    // 安全信息
    @GeckoField(fieldType = FieldType.STRING, description = "密码", columnshow = false)
    private String credential;

    @GeckoField(fieldType = FieldType.INTEGER, description = "冻结", searchable = true, nullable = true)
    private Boolean locked;

    @GeckoField(fieldType = FieldType.STRING, description = "盐", columnshow = false, nullable = true)
    private String salt;

    // 联系方式
    @GeckoField(fieldType = FieldType.STRING, nullable = true, description = "手机号码", searchable = true)
    private String mobilePhone;

    @GeckoField(fieldType = FieldType.STRING, nullable = true, description = "座机号码", searchable = true)
    private String telPhone;

    @GeckoField(fieldType = FieldType.STRING, nullable = true, description = "QQ", searchable = true)
    private String qq;

    @GeckoField(fieldType = FieldType.STRING, nullable = true, description = "Email", searchable = true)
    private String email;

    // 审计信息
    @GeckoField(fieldType = FieldType.DATETIME, description = "创建时间")
    private Timestamp createTime = new Timestamp(System.currentTimeMillis());

    public String getPrincipal() {
        return principal;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public String getCredential() {
        return credential;
    }

    public void setCredential(String credential) {
        this.credential = credential;
    }

    public Boolean getLocked() {
        return locked;
    }

    public void setLocked(Boolean locked) {
        this.locked = locked;
    }

    @JsonSerialize(using = JsonTimeSerializer.class)
    @JsonDeserialize(using = JsonTimeDeserializer.class)
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getTelPhone() {
        return telPhone;
    }

    public void setTelPhone(String telPhone) {
        this.telPhone = telPhone;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "AccountAbstract{" +
                "id='" + this.getId() + "\'," +
                "realName='" + realName + '\'' +
                ", principal='" + principal + '\'' +
                ", gender=" + gender +
                ", credential='" + credential + '\'' +
                ", locked=" + locked +
                ", salt='" + salt + '\'' +
                ", mobilePhone='" + mobilePhone + '\'' +
                ", telPhone='" + telPhone + '\'' +
                ", qq='" + qq + '\'' +
                ", email='" + email + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
