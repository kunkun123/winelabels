package org.gecko.framework.manager.entity.base;

import org.gecko.framework.base.BaseEntity;
import org.gecko.framework.manager.entity.enums.ProductLineStatus;
import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;

/**
 * 
 * AbstractMgProductline
 * MG_PRODUCTLINE
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-08 11:17:44 
 *
 */
public abstract class AbstractMgProductline extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	@GeckoField(primarykey=true,fieldType = GeckoField.FieldType.STRING, length = 10, nullable = false, description = "", searchable = true)
    private String id;

    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp3;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp1;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 30, nullable = true, description = "生产线编号", searchable = true)
    private String linenum;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp2;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 30, nullable = true, description = "生产线NVR链接地址", searchable = true)
    private String nvrip;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp4;
    
    @GeckoField(fieldType = GeckoField.FieldType.DATE, length = 7, nullable = true, description = "", searchable = true)
    private java.sql.Date lastupdate;
    
    @GeckoField(fieldType = GeckoField.FieldType.ENUM, length = 10, nullable = true, description = "状态（0-空闲 1-生产中 2-不可用） ", searchable = true)
    private ProductLineStatus status;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "企业ID", searchable = true)
    private String entid;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "创建人", searchable = true)
    private String creator;
    
    public void setTemp3(String temp3){
        this.temp3 = temp3;
    }

    public String getTemp3(){
        return this.temp3;
    }
    
    public void setTemp1(String temp1){
        this.temp1 = temp1;
    }

    public String getTemp1(){
        return this.temp1;
    }
    
    public void setLinenum(String linenum){
        this.linenum = linenum;
    }

    public String getLinenum(){
        return this.linenum;
    }
    
    public void setTemp2(String temp2){
        this.temp2 = temp2;
    }

    public String getTemp2(){
        return this.temp2;
    }
    
    public void setNvrip(String nvrip){
        this.nvrip = nvrip;
    }

    public String getNvrip(){
        return this.nvrip;
    }
    
    public void setTemp4(String temp4){
        this.temp4 = temp4;
    }

    public String getTemp4(){
        return this.temp4;
    }
    
    public void setLastupdate(java.sql.Date lastupdate){
        this.lastupdate = lastupdate;
    }

    public java.sql.Date getLastupdate(){
        return this.lastupdate;
    }
    
    public void setStatus(ProductLineStatus status){
        this.status = status;
    }

    public ProductLineStatus getStatus(){
        return this.status;
    }
    
    public void setEntid(String entid){
        this.entid = entid;
    }

    public String getEntid(){
        return this.entid;
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
        return "AbstractMgProductline{" +
                "id='" + id + '\'' +
                ", temp3=" + temp3 +
                ", temp1=" + temp1 +
                ", linenum=" + linenum +
                ", temp2=" + temp2 +
                ", nvrip=" + nvrip +
                ", temp4=" + temp4 +
                ", lastupdate=" + lastupdate +
                ", status=" + status +
                ", entid=" + entid +
                ", creator=" + creator +
                '}';
    }
}
