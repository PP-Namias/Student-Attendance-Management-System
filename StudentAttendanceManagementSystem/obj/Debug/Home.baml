   M S B A M L   `   `   `  ����T  PMahApps.Metro, Version=2.0.0.0, Culture=neutral, PublicKeyToken=51482d6f650b2b3fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  5      ( $Student Attendance Management System,   &StudentAttendanceManagementSystem.Home   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5      _ [MaterialDesignThemes.Wpf, Version=4.7.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962ac _MaterialDesignThemes.MahApps, Version=1.0.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aHmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes   5      6src,http://metro.mahapps.com/winfx/xaml/controls   5      -   5           MaterialDesignPaper#���   5
      $X��Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�5        MaterialDesignBody#���  5      $��Regular"�5      $��12(�5      &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5         TextRenderingMode$
 Auto=�5      $	��560��5      $
��1100��5       � 	Resources 5       �� MergedDictionaries �� Source�� 5   
    5      �� 5      $f `pack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Button.xaml?�6%   �� 5      $g apack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Shadows.xaml?�6%   �� 5      $l fpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.ToggleButton.xaml?�6%   �� 5      $h bpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.PopupBox.xaml?�6%   �� 5      $i cpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.TextBlock.xaml?�6%   �� 5      $o ipack://application:,,,/MaterialDesignColors;component/Themes/MaterialDesignColor.Green.Named.Primary.xaml?�6%   %    5       .��5#      � $	��560��6   $
��1100��6   
������� � RowDefinitions 5$   
   �� 5%      $
��Auto �6   �� 5&      $	��120 �6   �� 5'      $
��Auto �6   �� 5(      $	��120 �6   .+�5,   
   � -   5        $��	UserPages��5,      $��0��6   $��	20,0,20,0q�6-   5-      � 50   
   -   5        $��topgrid��50      $��1��6   $��Center=�6,   $	��Top=�6I   $��16q�6a    � ColumnDefinitions 51      �� 52      $
��Auto �6#   �� 53      $��* �6#   .+�55      �� $!��/Images/qr-code scanner.png��6   $��Uniform=�69   $��80��6K   $��80��6V   �� 56      $��1��6   $��24 0 0 0q�6)   $��Center=�6;   .+�58      �� -   5        $��WelcomeMessage��58   1   $
��Wrap=�6   61   �� 59        MaterialDesignFlatButton#��[ 6   )  #MaterialDesignThemes.Wpf.DrawerHost   OpenDrawerCommand#��Z 6K   .��5:      ��  �� Orientation$ 
Horizontal=�6!   .+�5;      '  !MaterialDesignThemes.Wpf.PackIcon  	   Kind$	 
Backburger=�62   �� 5<      $��8 0 0 0q�6$   �� 66   $�Open Quick Tasks��6:   6U   5=      5>      5?      5@      �� 5B   
   -   5        $��mainscrollviewer��5B   $   $��2��6   $
��Auto=�6>   $��Disabled=�6c   $��Center=�5C      $	��Top=�5D      $��0 0 0 0q�5E      .��5F      �  5G      �� 5H      $
��Auto �6$   �� 5I      $��* �6$   .+�5K      �� $��1��6   $ 
Horizontal=�6*   .+�5M      #  MaterialDesignThemes.Wpf.Card  $	��686��6*   $��4 2 8 16q�66   $	��300��6H   .��5N      � $��Stretch=�6    5O      �� 5P   "   $
��Auto �60   �� 5Q   "   $��* �60   �� 5R   "   $
��Auto �60   �� 5S   "   $
��Auto �60   �� 5T   "   $
��Auto �60    5V      �� 5W   "   $	��250 �63   �� 5X   "   $��* �63   .+�5Z      �� $/��)/Images/Student Attendance Management.png��6$   $��5��6W   
 �� StretchDirection$

 Both=�6h   $��UniformToFill=�6�   $��0,0,2,0q�6�   �� 5[      $��1��6(   $��
16 16 16 2q�68   $
��Home��6L   $��Center=�6X   $��36(�6u   �� 5\      $��1��6(   $��
16 46 16 2q�68   $��	Dashboard��6L   $��Center=�6^   $��36(�6{   �� 5]      $��1��6(   $��1��68   $
��Wrap=�6E   $��	16 0 16 8q�6Y     MaterialDesignBodyLight#���  6l   $��Center=�5^   8   �� 5_      $��1��6(   $��1��68   $
��Wrap=�6E   $��	16 0 16 8q�6Y   
�������$��Center=�5`   8   $3��-**DASHBOARD SAMPLE TEXT idk what to add T-T**��6S   $��Center=�6�   �� 5a      $��1��6%   $��2��65   $��0 1 0 0q�6B     MaterialDesignDivider#���  6\   $��0 8 0 0q�6�   ._�5b   "   � $��8q�6'   .+�5c   &   �� -   5         ��Name$ StudentAttendance��5c   �   ���#093A3E$��15(�6B   #���  6P   $
��Left=�6�   .��5d   *   �� $ 
Horizontal=�65   .+�5e   .     $	 AccountStudent=�6F   �� 5f   .   $��8 0 0 0q�68   $��Center=�6J   �� 6f   $�Student Attendance��6j   6�   5g   +   5h   '   �� 5i   &   -   5        $ SystemAdministration��5i   �   ���#093A3E$��15(�6B   #���  6P   $��Right=�6�   .��5j   *   �� $ 
Horizontal=�65   .+�5k   .     $	 SecurityAccount=�6F   �� 5l   .   $��8 0 0 0q�68   $��Center=�6I   �� 6e   $�System Administration��6i   6�   5m   +   5n   '   5o   #   5p      �� 5q      $��1��6%   $��3��65   $��0 1 0 0q�6B   #���  6\   ._�5r   "   � $��8q�6'   .+�5s   &   �� -   5        $ 	LoginLogs��5s   �   ���#093A3E$��15(�6B   #���  6P   $
��Left=�6�   .��5t   *   �� $ 
Horizontal=�65   .+�5u   .     $	 LoginVariant=�6F   �� 5v   .   $��8 0 0 0q�68   $��Center=�6I   �� 6e   $�
Login Logs��6i   6~   5w   +   5x   '   �� 5y   &   -	   5        $ ReportsandAnalytics��5y   �   ���#093A3E$��15(�6B   #���  6P   $��Right=�6�   .��5z   *   �� $ 
Horizontal=�65   .+�5{   .     $	 	ChartLine=�6F   �� 5|   .   $��8 0 5 0q�68   $��Center=�6I   �� 6e   $�Reports and Analytics��6i   6�   5}   +   5~   '   5   #   5�      �� 5�      $��1��6%   $��4��65   $��0 1 0 0q�6B   #���  6\   ._�5�   "   � $��8q�6'   .+�5�   &   �� -
   5        $ Logout��5�   �   ���#093A3E$��15(�6B   #���  6P   $
��Left=�6�   .��5�   *   �� $ 
Horizontal=�65   .+�5�   .     $	 Logout=�6F   �� 5�   .   $��8 0 0 0q�68   $��Center=�6I   �� 6e   $}�wDeveloper Mode                                                                                                         ��6i   5�   n   5�   +   5�   '   5�   #   5�      5�      5�      5�      5�      5�      '  !MaterialDesignThemes.Wpf.PopupBox  5�   
   -   5        $��homePopupBox��5�         	PopupMode$ Click=�5�      $��3��5�       - )MaterialDesignMultiFloatingActionPopupBox#��[ 5�      $��Right=�5�      $��Bottom=�5�      $��32q�5�      ���#093A3E
�������   PopupContent. 5�      �� .+�5�      �� -   5         � ToolTip$ Github��5�      
�������   PrimaryHueMidForegroundBrush#���  6Z   .��5�        $	 Github=�6.   $��30��6<   $��30��6G   5�      �� 5�      -   5        $ Email��5�        SecondaryAccentBrush#���  6E    " SecondaryAccentForegroundBrush#���  6y   .��5�        $	 Email=�6.   $��25��6<   $��25��6G   5�      5�      5�      5�      5�      