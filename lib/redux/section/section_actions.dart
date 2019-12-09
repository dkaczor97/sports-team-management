import 'package:sports_team_management/data/models/section.dart';
import 'package:sports_team_management/data/models/user_section.dart';

class LoadSections{
   
}

class AddSection{
  final Section section;
  AddSection(this.section);
}

class EditSection{
  final Section section;
  EditSection(this.section);
}

class LoadSectionsResult{
  final List<Section> sections;
  LoadSectionsResult(this.sections);
}

class AddUserSection{
  final UserSection userSection;
  AddUserSection(this.userSection);
}

class DeleteUserSection{
  final String id;
  DeleteUserSection(this.id);
}