import 'package:flutter/foundation.dart';

import 'package:time_tracker_app/domain/domain.dart';
import 'package:time_tracker_app/services/services.dart';

abstract class Database {
  Future<void> createJob(Job job);
  Stream<List<Job>> jobsStream();
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  FirestoreDatabase({
    @required this.uid,
  }) : assert(uid != null);

  final String uid;
  final _service = FirestoreServices.instance;

  Future<void> createJob(Job job) => _service.setData(
        path: APIPath.job(uid, documentIdFromCurrentDate()),
        data: job.toMap(),
      );

  Stream<List<Job>> jobsStream() => _service.collectionsStrem(
        path: APIPath.jobs(uid),
        builder: (data) => Job.fromMap(data),
      );
}
