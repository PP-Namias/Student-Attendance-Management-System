   M S B A M L   `   `   `  ����_  [Student Attendance Management System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullU/clr-namespace:StudentAttendanceManagementSystem!StudentAttendanceManagementSystem  5      T PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls 5      7    1StudentAttendanceManagementSystem.LoginLogsViewer   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962ac _MaterialDesignThemes.MahApps, Version=1.0.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5      =local/clr-namespace:StudentAttendanceManagementSystem   5      LControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro   5      6src,http://metro.mahapps.com/winfx/xaml/controls  5	         MaterialDesignPaper#���   5      $X��Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�5        MaterialDesignBody#���  5      $��Regular"�5      $��12(�5      &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5         TextRenderingMode$
 Auto=�5      $	��800��5      $
��1050��5      $	��800��5      $
��1125��5       � 	Resources 5       �� MergedDictionaries �� Source �� 
TargetType  MaterialDesignTextBox �� BasedOn �� Property �� Value  MaterialDesignPasswordBox  MaterialDesignComboBox  MaterialDesignSlider�� 5   
    5      �� 5      $h bpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.ComboBox.xaml?�6%   �� 5      $f `pack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Slider.xaml?�6%   �� 5      $g apack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.TextBox.xaml?�6%   �� 5      $f `pack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Button.xaml?�6%   �� 5      $g apack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Shadows.xaml?�6%   �� 5       $l fpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.ToggleButton.xaml?�6%   �� 5!      $h bpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.PopupBox.xaml?�6%   �� 5"      $i cpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.TextBlock.xaml?�6%   �� 5#      $h bpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.DataGrid.xaml?�6%   �� 5%      $o ipack://application:,,,/MaterialDesignColors;component/Themes/MaterialDesignColor.Green.Named.Primary.xaml?�6%   %p  '��       7  'G� R     7  '�� �     7  '(�     '�� �    7  �� 5'      " ��6   8   .�5(      ��  � ��$ 0 8 0 8q�6+   5)      �� 5*      " G�6   8   .�5+      ��  � ��$ 0 8 0 8q�6+   5,      �� 5-      " ��6   8   .�5.      ��  � ��$ Stretch=�68   �� 5/       � ��$ 0 8 0 8q�6+   50      �� 51      " (�6   .�52      ��  � ��$ 18��6*   �� 53       � ��$ 18��6+   �� 54       � ��$ 0 0 8 0q�6+   �� 55       � ��$ Center=�66   56      �� 57      " ��6   8   .�58      ��  � ��$ 0 8 0 8q�6+   59      5>      .��5A      � ���#1A120B.+�5B   
   �� $!��/Images/bg effects (13).png��6   $��UniformToFill=�65   �� 5C   
   	 �� Left$	 55��6   

 �� Top$
 30��5D   
   $	��700��5E   
   $��Center=�5F   
   $��1q�5G   
    �� CornerRadius$ 18��5H   
   $��	50,0,50,0q�5I   
   ��5J      L� 5K       j� Viewport$ 0,0,8,8�6    j� ViewportUnits$ Absolute=�62    j� TileMode$
 Tile=�6K    L� Drawing 5L      I� 5M      .��5N      �  � Brush
 ����� � Geometry 5O   "   � 5P   &   .��5Q   *   ��  �� Rect$ 	0,0,50,50�6<   �� 5R   *   $ 50,50,50,50�6<   5S   '   5U      5V      5X      ._�5Z      �� .+�5[      � -   5        $��	UserPages��5[   $   $��1��6   $��-51,-51,20,50q�65   
���   �6a   �� 5\      -   5        $��Title��5\      
�������$��0��6<   $��25q�6I   $��DemiBold"�6U   $��48(�6k   $	��483��6y   $
��Left=�6�   LOGIN LOGS VIEWER6�   �� 5]      -   5         ��Name$ NumberOfLogs��5]      
�������$��DemiBold"�6E   $��22(�6[   $	��225��6i   $��700,-100,0,0q�6u   $��26��6�   �� 6�   $�Number of logs: 000��6�   6�   �� 5^      $	 55��6   $
 30��5_      $	��500��5`      
�������$��1q�5b      $ 18��5c      $��	50,0,50,0q�5d      ._�5e      &   System.Windows.Controls.DataGrid  -   5          Name$ tblLoginLogs��5e      $��1��5f      ��. $
��Auto=�5h      $
��Auto=�5i         AutoGenerateColumns . $	��450��5k      $��Center=�5l      $	��885��5m         AlternatingRowBackground
 �����   CanUserAddRows .     
IsReadOnly .  K� ZIndex$ 3��5q         SelectionMode$ Single=�5r         SelectionUnit$ FullRow=�5s      5t      5u      �� 5w      -   5         ��Name$ 
btnArchive��5w       � ToolTip$ Archive Login Logs��5x      ���#3C2A21+  %MaterialDesignThemes.Wpf.ButtonAssist   CornerRadius$ 10��5z      
�������$��20(�5|      $	��218��5}      $��60��5~      $��Center=�5       � Cursor$
 Hand��5�      
�������$��1q�5�      $��Century Gothic)�5�      $
��Bold"�5�      $��-475,15,0,0q�5�      .��5�      � $��Center=�6    .+�5�      '  !MaterialDesignThemes.Wpf.PackIcon      Kind$  ArchivePlus=�5�      $��45��5�      $��45��5�      �� 5�      $��	| Archive��6$   $��Center=�5�   $   $��SemiBold"�5�   $   $
��10 0q�5�   $   5�      5�      �� 5�      -   5        $ 
btnRefresh��5�      $ Refresh Login Logs��5�      ���#3C2A21$ 10��5�      
�������$��20(�5�      $	��218��5�      $��60��5�      $��Center=�5�      $
 Hand��5�      
�������$��1q�5�      $��Century Gothic)�5�      $
��Bold"�5�      $��	0,-60,0,0q�5�      .��5�      � $��Center=�6    .+�5�        $  RefreshCircle=�5�      $��45��5�      $��45��5�      �� 5�      $��	| Refresh��6$   $��Center=�5�   $   $��SemiBold"�5�   $   $
��10 0q�5�   $   5�      5�      �� 5�      -   5        $ btnOpenArchive��5�      $ Refresh Login Logs��5�      ���#3C2A21$ 10��5�      
�������$��20(�5�      $	��218��5�      $��60��5�      $��Center=�5�      $
 Hand��5�      
�������$��1q�5�      $��Century Gothic)�5�      $
��Bold"�5�      $��475,-60,0,0q�5�      $��0q�5�      .��5�      � $��Center=�6    $	��218��6=   .+�5�        $
  Show=�5�      $��45��5�      $��45��5�      $��10,0,0,0q�5�      �� 5�      $��| Open Archive��6$   $��Center=�5�   $   $��SemiBold"�5�   $   $	��0 0q�5�   $   5�      5�      5�      5�      5�      5�      