import 'package:flutter/material.dart';

class NavItem {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const NavItem({required this.label, required this.icon, required this.onTap});
}
