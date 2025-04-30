package com.invosnap.model;

public class RoleModel {
    private int roleId;
    private String roleType;

    public RoleModel() {}

    public RoleModel(int roleId, String roleType) {
        this.roleId = roleId;
        this.roleType = roleType;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleType() {
        return roleType;
    }

    public void setRoleType(String roleType) {
        this.roleType = roleType;
    }
}
