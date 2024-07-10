part of '../bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());

  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is LoadProfile) {
      yield ProfileLoading();
      try {
        final profile = await _fetchProfile();
        yield ProfileLoaded(profile);
      } catch (e) {
        yield ProfileError(e.toString());
      }
    } else if (event is UpdateProfile) {
      yield ProfileLoading();
      try {
        final profile = await _updateProfile(event.user);
        yield ProfileLoaded(profile);
      } catch (e) {
        yield ProfileError(e.toString());
      }
    }
  }

  Future<User> _fetchProfile() async {
    final response =
        await http.get(Uri.parse('https://api.example.com/profile'));

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load profile');
    }
  }

  Future<User> _updateProfile(User user) async {
    final response = await http.put(
      Uri.parse('https://api.example.com/profile'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update profile');
    }
  }
}
