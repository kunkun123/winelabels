package org.gecko.framework.manager.entity.base;

import org.gecko.framework.base.BaseEntity;
import org.gecko.framework.manager.entity.enums.CameraStatus;
import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;

/**
 * 
 * AbstractMgCamera
 * MG_CAMERA
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-08 11:18:21 
 *
 */
public abstract class AbstractMgCamera extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	@GeckoField(primarykey=true,fieldType = GeckoField.FieldType.STRING, length = 10, nullable = false, description = "", searchable = true)
    private String id;

    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp4;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp3;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp1;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp2;
    
    @GeckoField(fieldType = GeckoField.FieldType.DATE, length = 7, nullable = true, description = "", searchable = true)
    private java.sql.Date lastupdatetime;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 30, nullable = true, description = "摄像头ip", searchable = true)
    private String cameraip;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "销售端ID", searchable = true)
    private String sellerid;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "生产线ID", searchable = true)
    private String lineid;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 10, nullable = true, description = "创建人", searchable = true)
    private String creator;
    
    @GeckoField(fieldType = GeckoField.FieldType.ENUM, length = 10, nullable = true, description = "状态（0-正常 1-不可用）", searchable = true)
    private CameraStatus status;
    
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
    
    public void setLastupdatetime(java.sql.Date lastupdatetime){
        this.lastupdatetime = lastupdatetime;
    }

    public java.sql.Date getLastupdatetime(){
        return this.lastupdatetime;
    }
    
    public void setCameraip(String cameraip){
        this.cameraip = cameraip;
    }

    public String getCameraip(){
        return this.cameraip;
    }
    
    public void setSellerid(String sellerid){
        this.sellerid = sellerid;
    }

    public String getSellerid(){
        return this.sellerid;
    }
    
    public void setLineid(String lineid){
        this.lineid = lineid;
    }

    public String getLineid(){
        return this.lineid;
    }
    
    public void setCreator(String creator){
        this.creator = creator;
    }

    public String getCreator(){
        return this.creator;
    }
    
    public void setStatus(CameraStatus status){
        this.status = status;
    }

    public CameraStatus getStatus(){
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
        return "AbstractMgCamera{" +
                "id='" + id + '\'' +
                ", temp4=" + temp4 +
                ", temp3=" + temp3 +
                ", temp1=" + temp1 +
                ", temp2=" + temp2 +
                ", lastupdatetime=" + lastupdatetime +
                ", cameraip=" + cameraip +
                ", sellerid=" + sellerid +
                ", lineid=" + lineid +
                ", creator=" + creator +
                ", status=" + status +
                '}';
    }
}
