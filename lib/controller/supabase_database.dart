import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDatabase{

  initDatabase() async{
    const supabaseKey = String.fromEnvironment("SUPABASE_KEY");
    const supabaseUrl = String.fromEnvironment("SUPABASE_URL");
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseKey,
    );
  }

  final supabase = Supabase.instance.client;
}