<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class BackupController extends Controller
{
    public function backup()
    {
        // Get database name from configuration
        $database_name = env('DB_DATABASE');

        // Get all table names from the database
        $tables = DB::select('SHOW TABLES');
        $sqlScript = "";

        foreach ($tables as $table) {
            $tableName = $table->{'Tables_in_' . $database_name};

            // Prepare SQL script for creating table structure
            $createTable = DB::selectOne("SHOW CREATE TABLE $tableName");
            $sqlScript .= "\n\n" . $createTable->{'Create Table'} . ";\n\n";

            // Prepare SQL script for dumping data for each table
            $rows = DB::table($tableName)->get();

            foreach ($rows as $row) {
                $rowArray = (array) $row;
                $rowValues = array_map(function ($value) {
                    // Escape special characters in each value
                    return '"' . addslashes($value) . '"';
                }, $rowArray);
                
                $sqlScript .= "INSERT INTO $tableName VALUES(" . implode(',', $rowValues) . ");\n";
            }
        }

        // Save the SQL script to a backup file
        $backup_file_name = "backups/" . $database_name . '_backup_' . Carbon::now()->format('Y-m-d_H-i-s') . '.sql';
        $fileHandler = fopen($backup_file_name, 'w+');

        if ($fileHandler) {
            fwrite($fileHandler, $sqlScript);
            fclose($fileHandler);

            return response()->json([
                'status' => 200,
                'message' => 'Backup was successfully created',
            ]);
        } else {
            return response()->json([
                'status' => 400,
                'error' => 'Backup could not be created',
            ]);
        }
    }
}
