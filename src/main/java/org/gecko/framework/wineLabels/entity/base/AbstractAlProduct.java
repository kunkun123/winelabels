package org.gecko.framework.wineLabels.entity.base;

import org.gecko.framework.base.BaseEntity;
import org.gecko.framework.ent.entity.enums.ProductType;
import org.gecko.framework.wineLabels.entity.enums.WineLablesType;
import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;

/**
 * 
 * AbstractAlProduct
 * 商品表
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-08 11:25:28 
 *
 */
public abstract class AbstractAlProduct extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	@GeckoField(primarykey=true,fieldType = GeckoField.FieldType.STRING, length = 10, nullable = false, description = "", searchable = true)
    private String id;

    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp4;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp3;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp2;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp1;
    
    @GeckoField(fieldType = GeckoField.FieldType.DATE, length = 7, nullable = true, description = "", searchable = true)
    private java.sql.Date lastupdatetime;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 30, nullable = true, description = "批次", searchable = true)
    private String batch;
    
    @GeckoField(fieldType = GeckoField.FieldType.DATE, length = 7, nullable = true, description = "创建日期", searchable = true)
    private java.sql.Date createdate;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "创建人", searchable = true)
    private String creator;
    
    @GeckoField(fieldType = GeckoField.FieldType.ENUM, length = 10, nullable = true, description = "采集类型", searchable = true)
    private WineLablesType collectiontype;
    
    @GeckoField(fieldType = GeckoField.FieldType.ENUM, length = 10, nullable = true, description = "产品类型", searchable = true)
    private ProductType producttype;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "规格", searchable = true)
    private String spec;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 50, nullable = true, description = "商品名称", searchable = true)
    private String productname;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "生产线ID", searchable = true)
    private String productlineid;
    
    public void setTemp4(String temp4){
        this.temp4 = temp4;
    }

    public String getTemp4(){
        return this.temp4;
    }
    
    public void setTemp3(String temp3){
        this.temp3 = temp3;
    }

    public String getTemp3(){
        return this.temp3;
    }
    
    public void setTemp2(String temp2){
        this.temp2 = temp2;
    }

    public String getTemp2(){
        return this.temp2;
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
    
    public void setBatch(String batch){
        this.batch = batch;
    }

    public String getBatch(){
        return this.batch;
    }
    
    public void setCreatedate(java.sql.Date createdate){
        this.createdate = createdate;
    }

    public java.sql.Date getCreatedate(){
        return this.createdate;
    }
    
    public void setCreator(String creator){
        this.creator = creator;
    }

    public String getCreator(){
        return this.creator;
    }
    
    public void setCollectiontype(WineLablesType collectiontype){
        this.collectiontype = collectiontype;
    }

    public WineLablesType getCollectiontype(){
        return this.collectiontype;
    }
    
    public void setProducttype(ProductType producttype){
        this.producttype = producttype;
    }

    public ProductType getProducttype(){
        return this.producttype;
    }
    
    public void setSpec(String spec){
        this.spec = spec;
    }

    public String getSpec(){
        return this.spec;
    }
    
    public void setProductname(String productname){
        this.productname = productname;
    }

    public String getProductname(){
        return this.productname;
    }
    
    public void setProductlineid(String productlineid){
        this.productlineid = productlineid;
    }

    public String getProductlineid(){
        return this.productlineid;
    }
    
    public void setId(String id){
        this.id = id;
    }

    public String getId(){
        return this.id;
    }

    @Override
    public String toString() {
        return "AbstractAlProduct{" +
                "id='" + id + '\'' +
                ", temp4=" + temp4 +
                ", temp3=" + temp3 +
                ", temp2=" + temp2 +
                ", temp1=" + temp1 +
                ", lastupdatetime=" + lastupdatetime +
                ", batch=" + batch +
                ", createdate=" + createdate +
                ", creator=" + creator +
                ", collectiontype=" + collectiontype +
                ", producttype=" + producttype +
                ", spec=" + spec +
                ", productname=" + productname +
                ", productlineid=" + productlineid +
                '}';
    }
}
