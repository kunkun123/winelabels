package org.gecko.framework.system.entity.base;

import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;
import org.gecko.framework.base.BaseEntity;
import org.gecko.framework.system.entity.enums.AuthorityType;

public abstract class AbstractAuthority extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @GeckoField(fieldType = FieldType.STRING, description = "主键", searchable = false)
    private String id;

    @GeckoField(fieldType = FieldType.ENUM, length = 10, description = "资源类型")
    private AuthorityType authorityType;

    @GeckoField(fieldType = FieldType.STRING, description = "资源编码", unique = true, searchable = true)
    private String authorityCode;

    @GeckoField(fieldType = FieldType.STRING, description = "资源名称", searchable = true)
    private String authorityName;

    @GeckoField(fieldType = FieldType.STRING, description = "所属资源")
    private String resource;

    @GeckoField(fieldType = FieldType.DOUBLE, description = "排列顺序", nullable = true)
    private Double sortIndex;

    public AuthorityType getAuthorityType() {
        return authorityType;
    }

    public void setAuthorityType(AuthorityType authorityType) {
        this.authorityType = authorityType;
    }

    public String getAuthorityCode() {
        return authorityCode;
    }

    public void setAuthorityCode(String authorityCode) {
        this.authorityCode = authorityCode;
    }

    public String getAuthorityName() {
        return authorityName;
    }

    public void setAuthorityName(String authorityName) {
        this.authorityName = authorityName;
    }

    public String getResource() {
        return resource;
    }

    public void setResource(String resource) {
        this.resource = resource;
    }

    public Double getSortIndex() {
        return sortIndex;
    }

    public void setSortIndex(Double sortIndex) {
        this.sortIndex = sortIndex;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "AbstractAuthority{" +
                "id='" + id + '\'' +
                ", authorityType=" + authorityType +
                ", authorityCode='" + authorityCode + '\'' +
                ", authorityName='" + authorityName + '\'' +
                ", resource='" + resource + '\'' +
                ", sortIndex=" + sortIndex +
                '}';
    }
}
