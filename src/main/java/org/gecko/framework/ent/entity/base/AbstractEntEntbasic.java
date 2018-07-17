package org.gecko.framework.ent.entity.base;

import org.gecko.framework.base.BaseEntity;
import org.gecko.framework.ent.entity.enums.ApplicationType;
import org.gecko.framework.ent.entity.enums.AuditingStatus;
import org.gecko.framework.ent.entity.enums.EntType;
import org.gecko.framework.manager.entity.enums.HaveOrNOT;
import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;

/**
 * 
 * AbstractEntEntbasic
 * ENT_ENTBASIC
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-08 16:26:47 
 *
 */
public abstract class AbstractEntEntbasic extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	@GeckoField(primarykey=true,fieldType = GeckoField.FieldType.STRING, length = 10, nullable = false, description = "", searchable = true)
    private String id;

    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 100, nullable = true, description = "营业执照附件地址", searchable = true)
    private String licenseattach;
    
    @GeckoField(fieldType = GeckoField.FieldType.ENUM, length = 2, nullable = true, description = "经销企业许可证的有无 ", searchable = true)
    private HaveOrNOT businesspermission;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "", searchable = true)
    private String creator;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 100, nullable = true, description = "零售企业许可证的附件地址 ", searchable = true)
    private String sellpermissionurl;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "", searchable = true)
    private String temp1;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 100, nullable = true, description = "生产企业许可证的附件地址 ", searchable = true)
    private String producepermissionurl;
    
    @GeckoField(fieldType = GeckoField.FieldType.ENUM, length = 2, nullable = true, description = "生产企业许可证的有无 ", searchable = true)
    private HaveOrNOT producepermission;
    
    @GeckoField(fieldType = GeckoField.FieldType.ENUM, length = 2, nullable = true, description = "零售企业许可证的有无 ", searchable = true)
    private HaveOrNOT sellpermission;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 30, nullable = true, description = "开户银行", searchable = true)
    private String bank;
    
    @GeckoField(fieldType = GeckoField.FieldType.ENUM, length = 2, nullable = true, description = "状态", searchable = true)
    private AuditingStatus status;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "", searchable = true)
    private String temp3;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 50, nullable = true, description = "企业名称", searchable = true)
    private String entname;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 20, nullable = true, description = "银行账号", searchable = true)
    private String acct;
    
    @GeckoField(fieldType = GeckoField.FieldType.ENUM, length = 2, nullable = true, description = "审核类型", searchable = true)
    private ApplicationType audittype;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "", searchable = true)
    private String temp4;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 100, nullable = true, description = "经销企业许可证的附件地址 ", searchable = true)
    private String businesspermissionurl;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 50, nullable = true, description = "电子邮件", searchable = true)
    private String email;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 100, nullable = true, description = "进口企业许可证的附件地址 ", searchable = true)
    private String importpermissionurl;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "", searchable = true)
    private String temp2;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 20, nullable = true, description = "联系电话", searchable = true)
    private String contactphone;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 50, nullable = true, description = "拒绝原因", searchable = true)
    private String reason;
    
    @GeckoField(fieldType = GeckoField.FieldType.DATE, length = 7, nullable = true, description = "", searchable = true)
    private java.sql.Date lastupdatetime;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 50, nullable = true, description = "联系人", searchable = true)
    private String contacts;
    
    @GeckoField(fieldType = GeckoField.FieldType.ENUM, length = 2, nullable = true, description = "进口企业许可证的有无 ", searchable = true)
    private HaveOrNOT importpermission;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 20, nullable = true, description = "电话", searchable = true)
    private String tel;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "原记录id", searchable = true)
    private String oldinfoid;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "审核人", searchable = true)
    private String auditor;
    
    @GeckoField(fieldType = GeckoField.FieldType.ENUM, length = 2, nullable = true, description = "企业类型", searchable = true)
    private EntType enttype;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 30, nullable = true, description = "统一社会信用代码", searchable = true)
    private String creditcode;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 100, nullable = true, description = "地址", searchable = true)
    private String address;
    
    public void setLicenseattach(String licenseattach){
        this.licenseattach = licenseattach;
    }

    public String getLicenseattach(){
        return this.licenseattach;
    }
    
    public void setBusinesspermission(HaveOrNOT businesspermission){
        this.businesspermission = businesspermission;
    }

    public HaveOrNOT getBusinesspermission(){
        return this.businesspermission;
    }
    
    public void setCreator(String creator){
        this.creator = creator;
    }

    public String getCreator(){
        return this.creator;
    }
    
    public void setSellpermissionurl(String sellpermissionurl){
        this.sellpermissionurl = sellpermissionurl;
    }

    public String getSellpermissionurl(){
        return this.sellpermissionurl;
    }
    
    public void setTemp1(String temp1){
        this.temp1 = temp1;
    }

    public String getTemp1(){
        return this.temp1;
    }
    
    public void setProducepermissionurl(String producepermissionurl){
        this.producepermissionurl = producepermissionurl;
    }

    public String getProducepermissionurl(){
        return this.producepermissionurl;
    }
    
    public void setProducepermission(HaveOrNOT producepermission){
        this.producepermission = producepermission;
    }

    public HaveOrNOT getProducepermission(){
        return this.producepermission;
    }
    
    public void setSellpermission(HaveOrNOT sellpermission){
        this.sellpermission = sellpermission;
    }

    public HaveOrNOT getSellpermission(){
        return this.sellpermission;
    }
    
    public void setBank(String bank){
        this.bank = bank;
    }

    public String getBank(){
        return this.bank;
    }
    
    public void setStatus(AuditingStatus status){
        this.status = status;
    }

    public AuditingStatus getStatus(){
        return this.status;
    }
    
    public void setTemp3(String temp3){
        this.temp3 = temp3;
    }

    public String getTemp3(){
        return this.temp3;
    }
    
    public void setEntname(String entname){
        this.entname = entname;
    }

    public String getEntname(){
        return this.entname;
    }
    
    public void setAcct(String acct){
        this.acct = acct;
    }

    public String getAcct(){
        return this.acct;
    }
    
    public void setAudittype(ApplicationType audittype){
        this.audittype = audittype;
    }

    public ApplicationType getAudittype(){
        return this.audittype;
    }
    
    public void setTemp4(String temp4){
        this.temp4 = temp4;
    }

    public String getTemp4(){
        return this.temp4;
    }
    
    public void setBusinesspermissionurl(String businesspermissionurl){
        this.businesspermissionurl = businesspermissionurl;
    }

    public String getBusinesspermissionurl(){
        return this.businesspermissionurl;
    }
    
    public void setEmail(String email){
        this.email = email;
    }

    public String getEmail(){
        return this.email;
    }
    
    public void setImportpermissionurl(String importpermissionurl){
        this.importpermissionurl = importpermissionurl;
    }

    public String getImportpermissionurl(){
        return this.importpermissionurl;
    }
    
    public void setTemp2(String temp2){
        this.temp2 = temp2;
    }

    public String getTemp2(){
        return this.temp2;
    }
    
    public void setContactphone(String contactphone){
        this.contactphone = contactphone;
    }

    public String getContactphone(){
        return this.contactphone;
    }
    
    public void setReason(String reason){
        this.reason = reason;
    }

    public String getReason(){
        return this.reason;
    }
    
    public void setLastupdatetime(java.sql.Date lastupdatetime){
        this.lastupdatetime = lastupdatetime;
    }

    public java.sql.Date getLastupdatetime(){
        return this.lastupdatetime;
    }
    
    public void setContacts(String contacts){
        this.contacts = contacts;
    }

    public String getContacts(){
        return this.contacts;
    }
    
    public void setImportpermission(HaveOrNOT importpermission){
        this.importpermission = importpermission;
    }

    public HaveOrNOT getImportpermission(){
        return this.importpermission;
    }
    
    public void setTel(String tel){
        this.tel = tel;
    }

    public String getTel(){
        return this.tel;
    }
    
    public void setOldinfoid(String oldinfoid){
        this.oldinfoid = oldinfoid;
    }

    public String getOldinfoid(){
        return this.oldinfoid;
    }
    
    public void setAuditor(String auditor){
        this.auditor = auditor;
    }

    public String getAuditor(){
        return this.auditor;
    }
    
    public void setEnttype(EntType enttype){
        this.enttype = enttype;
    }

    public EntType getEnttype(){
        return this.enttype;
    }
    
    public void setCreditcode(String creditcode){
        this.creditcode = creditcode;
    }

    public String getCreditcode(){
        return this.creditcode;
    }
    
    public void setAddress(String address){
        this.address = address;
    }

    public String getAddress(){
        return this.address;
    }
    
    public void setId(String id){
        this.id = id;
    }

    public String getId(){
        return this.id;
    }

    @Override
    public String toString() {
        return "AbstractEntEntbasic{" +
                "id='" + id + '\'' +
                ", licenseattach=" + licenseattach +
                ", businesspermission=" + businesspermission +
                ", creator=" + creator +
                ", sellpermissionurl=" + sellpermissionurl +
                ", temp1=" + temp1 +
                ", producepermissionurl=" + producepermissionurl +
                ", producepermission=" + producepermission +
                ", sellpermission=" + sellpermission +
                ", bank=" + bank +
                ", status=" + status +
                ", temp3=" + temp3 +
                ", entname=" + entname +
                ", acct=" + acct +
                ", audittype=" + audittype +
                ", temp4=" + temp4 +
                ", businesspermissionurl=" + businesspermissionurl +
                ", email=" + email +
                ", importpermissionurl=" + importpermissionurl +
                ", temp2=" + temp2 +
                ", contactphone=" + contactphone +
                ", reason=" + reason +
                ", lastupdatetime=" + lastupdatetime +
                ", contacts=" + contacts +
                ", importpermission=" + importpermission +
                ", tel=" + tel +
                ", oldinfoid=" + oldinfoid +
                ", auditor=" + auditor +
                ", enttype=" + enttype +
                ", creditcode=" + creditcode +
                ", address=" + address +
                '}';
    }
}
