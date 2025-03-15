import 'package:json_annotation/json_annotation.dart';

enum OrderStatus {
  @JsonValue('requested')
  requested,

  @JsonValue('repair')
  repair,

  @JsonValue('delivered')
  delivered,

  @JsonValue('deliver')
  deliver,

  @JsonValue('reviewed')
  reviewed,

  @JsonValue('canceled')
  canceled,

  @JsonValue('received')
  received,

  @JsonValue('done')
  done,

  @JsonValue('completedRequest')
  completedRequest,

  @JsonValue('on_the_way')
  onTheWay,

  @JsonValue('on_branch')
  onBranch,

  @JsonValue('external')
  external,
}
