   M S B A M L   `   `   `  ����_  [Student Attendance Management System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullU/clr-namespace:StudentAttendanceManagementSystem!StudentAttendanceManagementSystem  5   	   1    +StudentAttendanceManagementSystem.MainMenu2   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962ac _MaterialDesignThemes.MahApps, Version=1.0.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5   	   =local/clr-namespace:StudentAttendanceManagementSystem   5   	   -   5        $	��850��5	   	   $
��1200��6     � WindowStartupLocation$  CenterScreen=�6#    � WindowStyle$
 None=�5
   	    � 
ResizeMode$ NoResize=�6    � AllowsTransparency . ��62   Z� .��5      � .+�5   
   #  MaterialDesignThemes.Wpf.Card  $��10q�6      UniformCornerRadius$ 15Q�6*   .��5      �  � ColumnDefinitions 5      �� 5      $��1* �6'   �� 5      $	��15* �6'    � 	Resources 5      '  !MaterialDesignThemes.Wpf.PackIcon �� 
TargetType �� Property	 �� Value��%�   '        �� 5      "  6   .�5      ��  � ��$	 30��62   6?   �� 5       � ��$	 30��63   6@   5      5      .+�5      � $��0��6   $��Center=�6'   .+�5      d� -   5        
 d�Name$
 MenuToggleButton��5   r    '  #MaterialDesignHamburgerToggleButton#��[  6#    d� 	IsChecked$ FalseY�6`   $	��Top=�6�     5#      $��Center=�6*   .��5$      �� $��Bottom=�5%      .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ 
PrimaryMid=�5&       * &MaterialDesignNavigationRailTabControl#��[ 5'      .@�5(      �� ��5)   "   �� 5*   &   $
��auto��5+   )   $
��auto��5,   )   .+�5-   *     $��37��5.   -   $��37��5/   -   $��Center=�50   -      Kind$
 Home=�51   -   52   '   54      �� 55      ��56   "   �� 57   &   $
��auto��58   )   $
��auto��59   )   .+�5:   *     $��37��5;   -   $��37��5<   -   $��Center=�5=   -   $ AccountStudent=�5>   -   5?   '   5A      �� 5B      ��5C   "   �� 5D   &   $
��auto��5E   )   $
��auto��5F   )   .+�5G   *     $��37��5H   )   $��37��5I   )   $��Center=�5J   )   $ LoginVariant=�5K   )   5L   '   5N      �� 5R      ��5S   "   �� 5T   &   $
��auto��5U   )   $
��auto��5V   )   .+�5W   *     $��37��5X   )   $��37��5Y   )   $��Center=�5Z   )   $ 	ChartLine=�5[   )   5\   '   5^      �� 5`      ��5a   "   �� 5b   &   $
��auto��5c   )   $
��auto��5d   )   .+�5e   *     $��37��5f   )   $��37��5g   )   $��Center=�5h   )   $ SecurityAccount=�5i   )   5j   '   5l      �� 5m      ��5n   "   �� 5o   &   $
��auto��5p   )   $
��auto��5q   )   .+�5r   *     $��37��5s   )   $��37��5t   )   $��Center=�5u   )   $ BarcodeScan=�5v   )   5w   '   5y      5z      5{      5|      � 5}      -   5        $��RenderPages��5}   <   $��1��6   ���#F6F5F85      5�      5�      5�      5�      