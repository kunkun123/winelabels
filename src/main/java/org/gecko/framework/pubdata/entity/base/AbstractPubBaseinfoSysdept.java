package org.gecko.framework.pubdata.entity.base;

import org.gecko.framework.base.BaseEntity;
import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;

/**
 * 
 * AbstractPubBaseinfoSysdept
 * 部门管理
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-10-12 16:58:55 
 *
 */
public abstract class AbstractPubBaseinfoSysdept extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	@GeckoField(primarykey=true,fieldType = GeckoField.FieldType.BIGDECIMAL, length = 22, nullable = false, description = "id", searchable = true)
    private java.math.BigDecimal id;

    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 100, nullable = true, description = "纬度", searchable = true)
    private String coordinatey;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 100, nullable = true, description = "部门名称", searchable = true)
    private String deptname;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 60, nullable = true, description = "资源ID", searchable = true)
    private String sourceid;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 100, nullable = true, description = "经度", searchable = true)
    private String coordinatex;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 60, nullable = true, description = "部门编号", searchable = true)
    private String deptnum;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 500, nullable = true, description = "部门序列", searchable = true)
    private String squence;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 300, nullable = true, description = "部门全称", searchable = true)
    private String deptfullname;
    
    @GeckoField(fieldType = GeckoField.FieldType.BIGDECIMAL, length = 22, nullable = true, description = "行政区划", searchable = true)
    private java.math.BigDecimal area;
    
    @GeckoField(fieldType = GeckoField.FieldType.BIGDECIMAL, length = 22, nullable = true, description = "上级部门", searchable = true)
    private java.math.BigDecimal parentdept;
    
    public void setCoordinatey(String coordinatey){
        this.coordinatey = coordinatey;
    }

    public String getCoordinatey(){
        return this.coordinatey;
    }
    
    public void setDeptname(String deptname){
        this.deptname = deptname;
    }

    public String getDeptname(){
        return this.deptname;
    }
    
    public void setSourceid(String sourceid){
        this.sourceid = sourceid;
    }

    public String getSourceid(){
        return this.sourceid;
    }
    
    public void setCoordinatex(String coordinatex){
        this.coordinatex = coordinatex;
    }

    public String getCoordinatex(){
        return this.coordinatex;
    }
    
    public void setDeptnum(String deptnum){
        this.deptnum = deptnum;
    }

    public String getDeptnum(){
        return this.deptnum;
    }
    
    public void setSquence(String squence){
        this.squence = squence;
    }

    public String getSquence(){
        return this.squence;
    }
    
    public void setDeptfullname(String deptfullname){
        this.deptfullname = deptfullname;
    }

    public String getDeptfullname(){
        return this.deptfullname;
    }
    
    public void setArea(java.math.BigDecimal area){
        this.area = area;
    }

    public java.math.BigDecimal getArea(){
        return this.area;
    }
    
    public void setParentdept(java.math.BigDecimal parentdept){
        this.parentdept = parentdept;
    }

    public java.math.BigDecimal getParentdept(){
        return this.parentdept;
    }
    
    public void setId(java.math.BigDecimal id){
        this.id = id;
    }

    public java.math.BigDecimal getId(){
        return this.id;
    }

    @Override
    public String toString() {
        return "AbstractPubBaseinfoSysdept{" +
                "id='" + id + '\'' +
                ", coordinatey=" + coordinatey +
                ", deptname=" + deptname +
                ", sourceid=" + sourceid +
                ", coordinatex=" + coordinatex +
                ", deptnum=" + deptnum +
                ", squence=" + squence +
                ", deptfullname=" + deptfullname +
                ", area=" + area +
                ", parentdept=" + parentdept +
                '}';
    }
}
