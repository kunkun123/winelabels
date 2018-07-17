package org.gecko.framework.wineLabels.entity.base;

import org.gecko.framework.base.BaseEntity;
import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;

/**
 * 
 * AbstractAlAlcoholflow
 * 酒标流程表
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-05 16:40:01 
 *
 */
public abstract class AbstractAlAlcoholflow extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	@GeckoField(primarykey=true,fieldType = GeckoField.FieldType.STRING, length = 10, nullable = false, description = "", searchable = true)
    private String id;

    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp2;
    
    @GeckoField(fieldType = GeckoField.FieldType.DATE, length = 7, nullable = true, description = "销售采集时间", searchable = true)
    private java.sql.Date saledate;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp3;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp4;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 100, nullable = true, description = "流程名称", searchable = true)
    private String flowname;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp1;
    
    @GeckoField(fieldType = GeckoField.FieldType.DATE, length = 7, nullable = true, description = "", searchable = true)
    private java.sql.Date lastupdatetime;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "", searchable = true)
    private String creator;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 30, nullable = true, description = "酒标编号id", searchable = true)
    private String serial;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "流通环节id", searchable = true)
    private String salelinkid;
    
    public void setTemp2(String temp2){
        this.temp2 = temp2;
    }

    public String getTemp2(){
        return this.temp2;
    }
    
    public void setSaledate(java.sql.Date saledate){
        this.saledate = saledate;
    }

    public java.sql.Date getSaledate(){
        return this.saledate;
    }
    
    public void setTemp3(String temp3){
        this.temp3 = temp3;
    }

    public String getTemp3(){
        return this.temp3;
    }
    
    public void setTemp4(String temp4){
        this.temp4 = temp4;
    }

    public String getTemp4(){
        return this.temp4;
    }
    
    public void setFlowname(String flowname){
        this.flowname = flowname;
    }

    public String getFlowname(){
        return this.flowname;
    }
    
    public void setTemp1(String temp1){
        this.temp1 = temp1;
    }

    public String getTemp1(){
        return this.temp1;
    }
    
    public void setLastupdatetime(java.sql.Date lastupdatetime){
        this.lastupdatetime = lastupdatetime;
    }

    public java.sql.Date getLastupdatetime(){
        return this.lastupdatetime;
    }
    
    public void setCreator(String creator){
        this.creator = creator;
    }

    public String getCreator(){
        return this.creator;
    }
    
    public void setSerial(String serial){
        this.serial = serial;
    }

    public String getSerial(){
        return this.serial;
    }
    
    public void setSalelinkid(String salelinkid){
        this.salelinkid = salelinkid;
    }

    public String getSalelinkid(){
        return this.salelinkid;
    }
    
    public void setId(String id){
        this.id = id;
    }

    public String getId(){
        return this.id;
    }

    @Override
    public String toString() {
        return "AbstractAlAlcoholflow{" +
                "id='" + id + '\'' +
                ", temp2=" + temp2 +
                ", saledate=" + saledate +
                ", temp3=" + temp3 +
                ", temp4=" + temp4 +
                ", flowname=" + flowname +
                ", temp1=" + temp1 +
                ", lastupdatetime=" + lastupdatetime +
                ", creator=" + creator +
                ", serial=" + serial +
                ", salelinkid=" + salelinkid +
                '}';
    }
}
