package org.gecko.framework.wineLabels.entity.base;

import org.gecko.framework.base.BaseEntity;
import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;

/**
 * 
 * AbstractAlCirculation
 * 产品流通信息表
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-05 16:47:12 
 *
 */
public abstract class AbstractAlCirculation extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	@GeckoField(primarykey=true,fieldType = GeckoField.FieldType.STRING, length = 10, nullable = false, description = "", searchable = true)
    private String id;

    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp1;
    
    @GeckoField(fieldType = GeckoField.FieldType.DATE, length = 7, nullable = true, description = "", searchable = true)
    private java.sql.Date endtime;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "产品数量", searchable = true)
    private String productnum;
    
    @GeckoField(fieldType = GeckoField.FieldType.DATE, length = 7, nullable = true, description = "", searchable = true)
    private java.sql.Date lastupdatetime;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "上游企业id", searchable = true)
    private String topentid;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "下游企业id", searchable = true)
    private String belowentid;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp3;
    
    @GeckoField(fieldType = GeckoField.FieldType.DATE, length = 7, nullable = true, description = "", searchable = true)
    private java.sql.Date starttime;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp4;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp2;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "", searchable = true)
    private String creator;
    
    public void setTemp1(String temp1){
        this.temp1 = temp1;
    }

    public String getTemp1(){
        return this.temp1;
    }
    
    public void setEndtime(java.sql.Date endtime){
        this.endtime = endtime;
    }

    public java.sql.Date getEndtime(){
        return this.endtime;
    }
    
    public void setProductnum(String productnum){
        this.productnum = productnum;
    }

    public String getProductnum(){
        return this.productnum;
    }
    
    public void setLastupdatetime(java.sql.Date lastupdatetime){
        this.lastupdatetime = lastupdatetime;
    }

    public java.sql.Date getLastupdatetime(){
        return this.lastupdatetime;
    }
    
    public void setTopentid(String topentid){
        this.topentid = topentid;
    }

    public String getTopentid(){
        return this.topentid;
    }
    
    public void setBelowentid(String belowentid){
        this.belowentid = belowentid;
    }

    public String getBelowentid(){
        return this.belowentid;
    }
    
    public void setTemp3(String temp3){
        this.temp3 = temp3;
    }

    public String getTemp3(){
        return this.temp3;
    }
    
    public void setStarttime(java.sql.Date starttime){
        this.starttime = starttime;
    }

    public java.sql.Date getStarttime(){
        return this.starttime;
    }
    
    public void setTemp4(String temp4){
        this.temp4 = temp4;
    }

    public String getTemp4(){
        return this.temp4;
    }
    
    public void setTemp2(String temp2){
        this.temp2 = temp2;
    }

    public String getTemp2(){
        return this.temp2;
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
        return "AbstractAlCirculation{" +
                "id='" + id + '\'' +
                ", temp1=" + temp1 +
                ", endtime=" + endtime +
                ", productnum=" + productnum +
                ", lastupdatetime=" + lastupdatetime +
                ", topentid=" + topentid +
                ", belowentid=" + belowentid +
                ", temp3=" + temp3 +
                ", starttime=" + starttime +
                ", temp4=" + temp4 +
                ", temp2=" + temp2 +
                ", creator=" + creator +
                '}';
    }
}
