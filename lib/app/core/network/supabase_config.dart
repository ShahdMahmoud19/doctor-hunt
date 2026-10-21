
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  SupabaseConfig._();

  static const String projectUrl = 'https://tuwckhqvabyfvmeuffxr.supabase.co';
  static const String publishableKey =  'sb_publishable_1nEKIDTyValQiozemA_Vzw_Oxbz65ZX';

  static Future<void> initialize() async {
    await Supabase.initialize(
    url: projectUrl,
    publishableKey: publishableKey,
  );
  }

  static SupabaseClient get client => Supabase.instance.client;
}
