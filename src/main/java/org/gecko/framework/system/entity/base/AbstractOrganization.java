package org.gecko.framework.system.entity.base;

import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;
import org.gecko.framework.base.BaseEntity;
import org.gecko.framework.system.entity.enums.OrganizationCategory;

/**
 * 组织机构
 *
 * @author niupanfeng
 * OrgnizationAbstract
 * 组织机构
 * @date 2017年4月25日 下午6:44:02
 */
public abstract class AbstractOrganization extends BaseEntity {

    /**
     *
     */
    private static final long serialVersionUID = -8175359295728877791L;

    @GeckoField(fieldType = FieldType.STRING, description = "机构名称", searchable = true)
    private String orgName;

    @GeckoField(fieldType = FieldType.STRING, description = "机构编码", searchable = true, nullable = true)
    private String orgCode;

    @GeckoField(fieldType = FieldType.ENUM, description = "机构类型", searchable = true)
    private OrganizationCategory orgCategory;

    @GeckoField(fieldType = FieldType.STRING, description = "上级机构", nullable = true)
    private String parentOrg;

    @GeckoField(fieldType = FieldType.STRING, description = "机构序列", length = 500, columnshow = false)
    private String orgSeq;

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }

    public OrganizationCategory getOrgCategory() {
        return orgCategory;
    }

    public void setOrgCategory(OrganizationCategory orgCategory) {
        this.orgCategory = orgCategory;
    }

    public String getParentOrg() {
        return parentOrg;
    }

    public void setParentOrg(String parentOrg) {
        this.parentOrg = parentOrg;
    }

    public String getOrgSeq() {
        return orgSeq;
    }

    public void setOrgSeq(String orgSeq) {
        this.orgSeq = orgSeq;
    }

    @Override
    public String toString() {
        return "OrgnizationAbstract{" +
                "orgName='" + orgName + '\'' +
                ", orgCode='" + orgCode + '\'' +
                ", orgCategory=" + orgCategory +
                ", parentOrg=" + parentOrg +
                ", orgSeq='" + orgSeq + '\'' +
                '}';
    }
}
