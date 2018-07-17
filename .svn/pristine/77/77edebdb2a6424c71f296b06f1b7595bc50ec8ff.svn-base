package org.gecko.framework.ent.entity.base;

import org.gecko.framework.base.BaseEntity;
import org.gecko.framework.ent.entity.enums.ApplicationType;
import org.gecko.framework.ent.entity.enums.AuditingStatus;
import org.gecko.framework.ent.entity.enums.ProductType;
import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;

/**
 * 
 * AbstractEntApplication
 * 酒标申请记录
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-05 20:31:34 
 *
 */
public abstract class AbstractEntApplication extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	@GeckoField(primarykey=true,fieldType = GeckoField.FieldType.STRING, length = 10, nullable = false, description = "", searchable = true)
    private String id;

    @GeckoField(fieldType = GeckoField.FieldType.DATE, length = 7, nullable = true, description = "审核日期", searchable = true)
    private java.sql.Date auditdate;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 2, nullable = true, description = "产品类型", searchable = true)
    private ProductType producttype;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp4;
    
    @GeckoField(fieldType = GeckoField.FieldType.ENUM, length = 2, nullable = true, description = "审核状态", searchable = true)
    private AuditingStatus auditingstatus;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "申请数量", searchable = true)
    private String productnumber;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 2, nullable = true, description = "申请类型", searchable = true)
    private ApplicationType aduittype;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "审核人", searchable = true)
    private String auditor;
    
    @GeckoField(fieldType = GeckoField.FieldType.DATE, length = 7, nullable = true, description = "", searchable = true)
    private java.sql.Date lastupdatetime;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp2;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "申请人", searchable = true)
    private String applicant;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp1;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 100, nullable = true, description = "拒绝原因", searchable = true)
    private String reason;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp3;
    
    @GeckoField(fieldType = GeckoField.FieldType.DATE, length = 7, nullable = true, description = "申请日期", searchable = true)
    private java.sql.Date applicandate;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "", searchable = true)
    private String creator;
    
    public void setAuditdate(java.sql.Date auditdate){
        this.auditdate = auditdate;
    }

    public java.sql.Date getAuditdate(){
        return this.auditdate;
    }
    
    public void setProducttype(ProductType producttype){
        this.producttype = producttype;
    }

    public ProductType getProducttype(){
        return this.producttype;
    }
    
    public void setTemp4(String temp4){
        this.temp4 = temp4;
    }

    public String getTemp4(){
        return this.temp4;
    }
    
    public void setAuditingstatus(AuditingStatus auditingstatus){
        this.auditingstatus = auditingstatus;
    }

    public AuditingStatus getAuditingstatus(){
        return this.auditingstatus;
    }
    
    public void setProductnumber(String productnumber){
        this.productnumber = productnumber;
    }

    public String getProductnumber(){
        return this.productnumber;
    }
    
    public void setAduittype(ApplicationType aduittype){
        this.aduittype = aduittype;
    }

    public ApplicationType getAduittype(){
        return this.aduittype;
    }
    
    public void setAuditor(String auditor){
        this.auditor = auditor;
    }

    public String getAuditor(){
        return this.auditor;
    }
    
    public void setLastupdatetime(java.sql.Date lastupdatetime){
        this.lastupdatetime = lastupdatetime;
    }

    public java.sql.Date getLastupdatetime(){
        return this.lastupdatetime;
    }
    
    public void setTemp2(String temp2){
        this.temp2 = temp2;
    }

    public String getTemp2(){
        return this.temp2;
    }
    
    public void setApplicant(String applicant){
        this.applicant = applicant;
    }

    public String getApplicant(){
        return this.applicant;
    }
    
    public void setTemp1(String temp1){
        this.temp1 = temp1;
    }

    public String getTemp1(){
        return this.temp1;
    }
    
    public void setReason(String reason){
        this.reason = reason;
    }

    public String getReason(){
        return this.reason;
    }
    
    public void setTemp3(String temp3){
        this.temp3 = temp3;
    }

    public String getTemp3(){
        return this.temp3;
    }
    
    public void setApplicandate(java.sql.Date applicandate){
        this.applicandate = applicandate;
    }

    public java.sql.Date getApplicandate(){
        return this.applicandate;
    }
    
    public void setCreator(String creator){
        this.creator = creator;
    }

    public String getCreator(){
        return this.creator;
    }
    
    public void setId(String id){
        this.id = id;
    }

    public String getId(){
        return this.id;
    }

    @Override
    public String toString() {
        return "AbstractEntApplication{" +
                "id='" + id + '\'' +
                ", auditdate=" + auditdate +
                ", producttype=" + producttype +
                ", temp4=" + temp4 +
                ", auditingstatus=" + auditingstatus +
                ", productnumber=" + productnumber +
                ", aduittype=" + aduittype +
                ", auditor=" + auditor +
                ", lastupdatetime=" + lastupdatetime +
                ", temp2=" + temp2 +
                ", applicant=" + applicant +
                ", temp1=" + temp1 +
                ", reason=" + reason +
                ", temp3=" + temp3 +
                ", applicandate=" + applicandate +
                ", creator=" + creator +
                '}';
    }
}
