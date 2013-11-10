use strict;
use warnings;
use utf8;
use Amon2::Lite;

use Digest::MD5 qw(md5_hex);

use DBIx::Sunny;
sub db {
    my $self = shift;
    my $db_name = 'mobacon_perl';
    my $host    = '';
    my $user    = 'root';
    my $pass    = '';
    return DBIx::Sunny->connect(
        "dbi:mysql:$db_name;host=$host",
        $user,
        $pass,
    );
}

post '/admin/reset' => sub {
    my ($c, ) = @_;
    $c->db->query(q{TRUNCATE TABLE `user`});
    $c->db->query(q{TRUNCATE TABLE `rental`});
    return $c->create_response(204);
};

post '/user/register' => sub {
    my ($c, ) = @_;
    my $username = $c->req->param('username');
    my $password = $c->req->param('password');
    my $api_key = md5_hex($username . $password);
    $c->db->query(q{INSERT INTO `user` (username, api_key) VALUES (?, ?)}, $username, $api_key);

    my $user = $c->db->select_row(q{SELECT * FROM `user` WHERE username = ?}, $username);

    return $c->render_json($user);
};

__PACKAGE__->load_plugins(
    'Web::JSON',
);
__PACKAGE__->to_app;

