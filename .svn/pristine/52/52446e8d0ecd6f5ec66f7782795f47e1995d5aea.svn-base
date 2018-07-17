package org.gecko.framework.system.entity.base;

import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;
import org.gecko.framework.base.BaseEntity;
import org.gecko.framework.system.entity.enums.ResourceType;

public abstract class AbstractResource extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @GeckoField(fieldType = FieldType.STRING, description = "主键", searchable = false)
    private String id;

    @GeckoField(fieldType = FieldType.STRING, description = "资源名称", searchable = true)
    private String sourceName;

    @GeckoField(fieldType = FieldType.ENUM, description = "资源类型", searchable = true)
    private ResourceType resourceType;

    @GeckoField(fieldType = FieldType.INTEGER, description = "平台资源")
    private Boolean isPlatform;

    @GeckoField(fieldType = FieldType.STRING, nullable = true, description = "父节点ID")
    private String parentId;

    @GeckoField(fieldType = FieldType.STRING, length = 500, nullable = true, description = "节点序列")
    private String resourceSeq;

    @GeckoField(fieldType = FieldType.STRING, unique = true, description = "链接地址")
    private String uri;

    @GeckoField(fieldType = FieldType.STRING, nullable = true, description = "图标")
    private String iconCls;

    @GeckoField(fieldType = FieldType.DOUBLE, nullable = true, description = "排列顺序")
    private Double sortIndex;

    @GeckoField(fieldType = FieldType.INTEGER, nullable = true, description = "是否可用")
    private Boolean available;

    public String getSourceName() {
        return sourceName;
    }

    public void setSourceName(String sourceName) {
        this.sourceName = sourceName;
    }

    public ResourceType getResourceType() {
        return resourceType;
    }

    public void setResourceType(ResourceType resourceType) {
        this.resourceType = resourceType;
    }

    public Boolean getIsPlatform() {
        return isPlatform;
    }

    public void setIsPlatform(Boolean isPlatform) {
        this.isPlatform = isPlatform;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getResourceSeq() {
        return resourceSeq;
    }

    public void setResourceSeq(String resourceSeq) {
        this.resourceSeq = resourceSeq;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public Double getSortIndex() {
        return sortIndex;
    }

    public void setSortIndex(Double sortIndex) {
        this.sortIndex = sortIndex;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
