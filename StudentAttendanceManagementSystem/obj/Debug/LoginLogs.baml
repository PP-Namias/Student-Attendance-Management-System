   M S B A M L   `   `   `  ����_  [Student Attendance Management System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullU/clr-namespace:StudentAttendanceManagementSystem!StudentAttendanceManagementSystem  5      T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls 5      1    +StudentAttendanceManagementSystem.LoginLogs   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      Alocal/clr-namespace:StudentAttendanceManagementSystem     5      PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5      _ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962ac _MaterialDesignThemes.MahApps, Version=1.0.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5      6src,http://metro.mahapps.com/winfx/xaml/controls  5	         MaterialDesignPaper#���   5      $X��Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�5        MaterialDesignBody#���  5      $��Regular"�5      $��12(�5      &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5         TextRenderingMode$
 Auto=�5      $	��537��5      $	��861��5       � 	Resources 5       �� MergedDictionaries �� Source�� 5   
    5      �� 5      $f `pack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Button.xaml?�6%   �� 5      $g apack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Shadows.xaml?�6%   �� 5      $l fpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.ToggleButton.xaml?�6%   �� 5      $h bpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.PopupBox.xaml?�6%   �� 5      $i cpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.TextBlock.xaml?�6%   �� 5      $o ipack://application:,,,/MaterialDesignColors;component/Themes/MaterialDesignColor.Green.Named.Primary.xaml?�6%   %    5       .��5#      �  � RowDefinitions 5$   
   �� 5%      $
��Auto �6   �� 5&      $	��140 �6   �� 5'      $
��Auto �6   .+�5*   
   � -   5        $��	UserPages��5*      $��0��6   $��	20,0,20,0q�6-   5+      � 5.   
   -   5        $��topgrid��5.      $��1��6   $��Center=�6,   $	��Top=�6I   $��16q�6a    � ColumnDefinitions 5/      �� 50      $
��Auto �6#   �� 51      $��* �6#   .+�53      �� $!��/Images/qr-code scanner.png��6   $��Uniform=�69   $��80��6K   $��80��6V   �� 54      $��1��6   $��24 0 0 0q�6)   $��Center=�6;   .+�56      �� -   5        $��WelcomeMessage��56   1   $
��Wrap=�6   61   �� 57        MaterialDesignFlatButton#��[ 6   )  #MaterialDesignThemes.Wpf.DrawerHost   OpenDrawerCommand#��Z 6K   .��58      ��  �� Orientation$ 
Horizontal=�6!   .+�59      '  !MaterialDesignThemes.Wpf.PackIcon  	   Kind$	 
Backburger=�62   �� 5:      $��8 0 0 0q�6$   �� 66   $�Open Quick Tasks��6:   6U   5;      5<      5=      5>      �� 5@   
   -   5        $��mainscrollviewer��5@      $��3��6/   $
��Auto=�6<   $
��Auto=�6a   $��Center=�5A      $	��Top=�5B      $��0 0 0 0q�5C      .��5D      �  5E      �� 5F      $
��Auto �6$   �� 5G      $��* �6$   .+�5I      �� $��1��6   $ 
Horizontal=�6*   .+�5K      #  MaterialDesignThemes.Wpf.Card  $	��686��6*   $��4 2 8 16q�66   $	��300��6H   .��5L      � $��Stretch=�6    5M      �� 5N   "   $
��Auto �60   �� 5O   "   $��* �60   �� 5P   "   $
��Auto �60   �� 5Q   "   $
��Auto �60   �� 5R   "   $
��Auto �60   �� 5S   "   $
��Auto �60    5U      �� 5V   "   $	��250 �63   �� 5W   "   $��* �63   .+�5Y      �� $/��)/Images/Student Attendance Management.png��6$   $��5��6W   
 �� StretchDirection$

 Both=�6h   $��UniformToFill=�6�   $��0,0,2,0q�6�   �� 5Z      $��1��6(   $��
16 16 16 2q�68   $��
Login Logs��6L   $��Center=�6^   $��36(�6{   �� 5[      $��1��6(   $��
16 46 16 2q�68   $��
Management��6L   $��Center=�6_   $��36(�6|   �� 5\      $��1��6(   $��1��68   $
��Wrap=�6E   $��	16 0 16 8q�6Y   
�������$��Center=�5]   8   $;��5Manage all the Login Logs through the below options. ��6S   $��Center=�6�   �� 5^      $��1��6%   $��2��65   $��0 1 0 0q�6B     MaterialDesignDivider#���  6\   $��0 8 0 0q�6�   ._�5_   "   � $��8q�6'   .+�5`   &   �� -   5         ��Name$ LoginLogsViewer��5`   �   $��15(�6-   #���  6;   $
��Left=�6n   .��5a   *   �� $ 
Horizontal=�65   .+�5b   .     $	 TableAccount=�6F   ���#093A3E6Z   �� 5c   .   ���#093A3E$��8 0 0 0q�6M   $��Center=�6^   �� 6z   $�Login Logs Viewer��6~   6�   5d   +   5e   '   5f   #   5g      �� 5h      $��1��6%   $��3��65   $��0 1 0 0q�6B   #���  6\   ._�5i   "   � $��8q�6'   .+�5j   &   �� -   5        $ 	AddNewLog��5j   �   $��15(�6-   #���  6;   $
��Left=�6n   .��5k   *   �� $ 
Horizontal=�65   .+�5l   .     $	 AccountMultiplePlus=�6F   ���#093A3E6a   �� 5m   .   ���#093A3E$��8 0 0 0q�6M   $��Center=�6^   �� 6z   $�Add New Log��6~   6�   5n   +   5o   '   5p   #   5q      �� 5r      $��1��6%   $��4��65   $��0 1 0 0q�6B   #���  6\   ._�5s   "   � $��8q�6'   .+�5t   &   �� -   5        $ 	ModifyLog��5t   �   $��15(�6-   #���  6;   $
��Left=�6n   .��5u   *   �� $ 
Horizontal=�65   .+�5v   .     $	 BookEdit=�6F   ���#093A3E6V   �� 5w   .   ���#093A3E$��8 0 0 0q�6M   $��Center=�6^   �� 6z   $�
Modify Log��6~   6�   5x   +   5y   '   5z   #   5{      5|      5}      5      5�      5�      5�      5�      