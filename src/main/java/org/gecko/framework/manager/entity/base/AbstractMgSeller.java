package org.gecko.framework.manager.entity.base;

import org.gecko.framework.base.BaseEntity;
import org.gecko.framework.manager.entity.enums.SELLERStatus;
import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;

/**
 * 
 * AbstractMgSeller
 * MG_SELLER
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-08 11:13:15 
 *
 */
public abstract class AbstractMgSeller extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	@GeckoField(primarykey=true,fieldType = GeckoField.FieldType.STRING, length = 10, nullable = false, description = "", searchable = true)
    private String id;

    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp1;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp2;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "企业id ", searchable = true)
    private String entid;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp4;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "创建人", searchable = true)
    private String creator;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp3;
    
    @GeckoField(fieldType = GeckoField.FieldType.DATE, length = 7, nullable = true, description = "", searchable = true)
    private java.sql.Date lastupdatetime;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 30, nullable = true, description = "销售端编号", searchable = true)
    private String sellernum;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 30, nullable = true, description = "销售端NVR连接地址 ", searchable = true)
    private String nvrip;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "状态（0-空闲 1-不可用） ", searchable = true)
    private SELLERStatus status;
    
    public void setTemp1(String temp1){
        this.temp1 = temp1;
    }

    public String getTemp1(){
        return this.temp1;
    }
    
    public void setTemp2(String temp2){
        this.temp2 = temp2;
    }

    public String getTemp2(){
        return this.temp2;
    }
    
    public void setEntid(String entid){
        this.entid = entid;
    }

    public String getEntid(){
        return this.entid;
    }
    
    public void setTemp4(String temp4){
        this.temp4 = temp4;
    }

    public String getTemp4(){
        return this.temp4;
    }
    
    public void setCreator(String creator){
        this.creator = creator;
    }

    public String getCreator(){
        return this.creator;
    }
    
    public void setTemp3(String temp3){
        this.temp3 = temp3;
    }

    public String getTemp3(){
        return this.temp3;
    }
    
    public void setLastupdatetime(java.sql.Date lastupdatetime){
        this.lastupdatetime = lastupdatetime;
    }

    public java.sql.Date getLastupdatetime(){
        return this.lastupdatetime;
    }
    
    public void setSellernum(String sellernum){
        this.sellernum = sellernum;
    }

    public String getSellernum(){
        return this.sellernum;
    }
    
    public void setNvrip(String nvrip){
        this.nvrip = nvrip;
    }

    public String getNvrip(){
        return this.nvrip;
    }
    
    public void setStatus(SELLERStatus status){
        this.status = status;
    }

    public SELLERStatus getStatus(){
        return this.status;
    }
    
    public void setId(String id){
        this.id = id;
    }

    public String getId(){
        return this.id;
    }

    @Override
    public String toString() {
        return "AbstractMgSeller{" +
                "id='" + id + '\'' +
                ", temp1=" + temp1 +
                ", temp2=" + temp2 +
                ", entid=" + entid +
                ", temp4=" + temp4 +
                ", creator=" + creator +
                ", temp3=" + temp3 +
                ", lastupdatetime=" + lastupdatetime +
                ", sellernum=" + sellernum +
                ", nvrip=" + nvrip +
                ", status=" + status +
                '}';
    }
}
