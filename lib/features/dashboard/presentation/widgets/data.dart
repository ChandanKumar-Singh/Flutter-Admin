import 'package:flutter/material.dart';

var navItemsJson = {
  "items": [
    {
      "id": "dashboard",
      "title": "Dashboard",
      "caption": "Overview of your system’s performance",
      "type": "group",
      "children": [
        {
          "id": "default-dashboard",
          "title": "Main Dashboard",
          "type": "item",
          "url": "/dashboard",
          "icon": Icons.dashboard
        },
        {
          "id": "analytics-dashboard",
          "title": "Analytics",
          "type": "item",
          "url": "/dashboard/analytics",
          "icon": Icons.analytics
        },
        {
          "id": "sales-dashboard",
          "title": "Sales Overview",
          "type": "item",
          "url": "/dashboard/sales",
          "icon": Icons.attach_money
        }
      ]
    },
    {
      "id": "users",
      "title": "User Management",
      "caption": "Manage your users, roles, and permissions",
      "type": "group",
      "children": [
        {
          "id": "users-list",
          "title": "User List",
          "type": "collapse",
          "icon": Icons.people,
          "children": [
            {
              "id": "all-users",
              "title": "All Users",
              "type": "item",
              "url": "/users/list/all",
              "icon": Icons.list
            },
            {
              "id": "active-users",
              "title": "Active Users",
              "type": "item",
              "url": "/users/list/active",
              "icon": Icons.check_circle
            },
            {
              "id": "blocked-users",
              "title": "Blocked Users",
              "type": "item",
              "url": "/users/list/blocked",
              "icon": Icons.block
            }
          ]
        },
        {
          "id": "user-roles",
          "title": "Roles & Permissions",
          "type": "item",
          "url": "/users/roles",
          "icon": Icons.lock
        },
        {
          "id": "user-profile",
          "title": "User Profiles",
          "type": "item",
          "url": "/users/profile",
          "icon": Icons.person
        }
      ]
    },
    {
      "id": "settings",
      "title": "Settings",
      "caption": "Configure your system preferences",
      "type": "group",
      "children": [
        {
          "id": "general-settings",
          "title": "General Settings",
          "type": "item",
          "url": "/settings/general",
          "icon": Icons.settings
        },
        {
          "id": "account-settings",
          "title": "Account Settings",
          "type": "item",
          "url": "/settings/account",
          "icon": Icons.account_circle
        }
      ]
    },
    {
      "id": "reports",
      "title": "Reports",
      "caption": "View and generate reports",
      "type": "group",
      "children": [
        {
          "id": "sales-report",
          "title": "Sales Report",
          "type": "item",
          "url": "/reports/sales",
          "icon": Icons.insert_chart
        },
        {
          "id": "user-report",
          "title": "User Report",
          "type": "item",
          "url": "/reports/users",
          "icon": Icons.people_outline
        }
      ]
    }
  ]
};
